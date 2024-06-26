import tensorflow as tf
from tensorflow.keras.models import Model
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, BatchNormalization, ReLU, Add, Dense, GlobalAveragePooling2D, Dropout
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.callbacks import EarlyStopping, ReduceLROnPlateau
from tensorflow.keras.preprocessing.image import ImageDataGenerator
import matplotlib.pyplot as plt
import numpy as np
from sklearn.metrics import confusion_matrix



# Defining the paths to the dataset
train_data = 'D:/Project/Plant-Leaf-Disease-Prediction-main/Potato_dataset/Training'
test_data = 'D:/Project/Plant-Leaf-Disease-Prediction-main/Potato_dataset/Validation'

# Initializing the CNN
np.random.seed(1337)

# Defining the number of classes and other parameters
num_classes = 3
input_shape = (32, 32, 3)
batch_size = 16
epochs = 200

# Normalization
train_data_gen = ImageDataGenerator(rescale=1./255,
                                   rotation_range=20,
                                   width_shift_range=0.2,
                                   height_shift_range=0.2,
                                   shear_range=0.2,
                                   zoom_range=0.2,
                                   horizontal_flip=True)
test_data_gen = ImageDataGenerator(rescale=1./255)

# Preprocess and augment the training images
train_generator = train_data_gen.flow_from_directory(
    'D:/Project/Plant-Leaf-Disease-Prediction-main/Potato_dataset/Training',
    target_size=(input_shape[0], input_shape[1]),
    batch_size=batch_size,
    class_mode='categorical'
)

# Load and preprocess the testing dataset
test_generator = test_data_gen.flow_from_directory(
    'D:/Project/Plant-Leaf-Disease-Prediction-main/Potato_dataset/Validation',
    target_size=(input_shape[0], input_shape[1]),
    batch_size=batch_size,
    class_mode='categorical'
)


# Define the custom ResNet-like block
def resnet_block(x, filters, kernel_size=3, stride=1):
    # Shortcut
    shortcut = x

    # Adjust the shortcut dimensions if needed
    if shortcut.shape[-1] != filters or stride != 1:
        shortcut = Conv2D(filters, kernel_size=1, strides=stride, padding='same')(shortcut)
    
    # First convolution layer
    x = Conv2D(filters, kernel_size=kernel_size, strides=stride, padding='same')(x)
    x = BatchNormalization()(x)
    x = ReLU()(x)

    # Second convolution layer
    x = Conv2D(filters, kernel_size=kernel_size, strides=1, padding='same')(x)
    x = BatchNormalization()(x)

    # Add the shortcut to the main path
    x = Add()([x, shortcut])
    x = ReLU()(x)

    return x

input_tensor = tf.keras.Input(shape=input_shape)
# Build the custom ResNet-50-like model
model = Sequential()

# Initial convolution layer
x = Conv2D(64, kernel_size=7, strides=2, padding='same', input_shape=input_shape)(input_tensor)
x = BatchNormalization()(x)
x = ReLU()(x)

# Residual blocks
x = resnet_block(x, filters=64)
x = resnet_block(x, filters=64)
x = resnet_block(x, filters=128, stride=2)
x = resnet_block(x, filters=128)
x = resnet_block(x, filters=256, stride=2)
x = resnet_block(x, filters=256)
x = resnet_block(x, filters=128, stride=2)
x = resnet_block(x, filters=128)
x = resnet_block(x, filters=512, stride=2)
x = resnet_block(x, filters=512)

# Global average pooling and fully connected layer
x = GlobalAveragePooling2D()(x)
x = Dense(units=64, activation='relu')(x)
x = BatchNormalization()(x)
x = Dropout(0.5)(x)
output_tensor = Dense(units=num_classes, activation='softmax')(x)

# Set the model's output
model = Model(inputs=input_tensor, outputs=output_tensor)

# Compile the classifier
model.compile(optimizer=Adam(learning_rate=0.0001), loss='categorical_crossentropy', metrics=['accuracy'])

# Add EarlyStopping and ReduceLROnPlateau callbacks
early_stopping = EarlyStopping(monitor='val_loss', patience=5, restore_best_weights=True)
reduce_lr = ReduceLROnPlateau(monitor='val_loss', factor=0.1, patience=3, min_lr=1e-8)

# Train the classifier
history = model.fit(train_generator,
                    steps_per_epoch=train_generator.n // batch_size,
                    epochs=epochs,
                    validation_data=test_generator,
                    validation_steps=test_generator.samples // batch_size,
                    callbacks=[early_stopping, reduce_lr])



# Save the classifier
model.save('potato_cnn_classifier.h5')

# Evaluate the classifier on the testing dataset
test_loss, test_accuracy = model.evaluate(test_generator)

# Compute the predicted labels for the testing dataset
predicted_labels = model.predict(test_generator)
predicted_classes = np.argmax(predicted_labels, axis=1)

# Get the true labels for the testing dataset
true_labels = test_generator.classes

# Compute the accuracy
accuracy = np.sum(predicted_classes == true_labels) / len(true_labels)

print('Test Loss:', test_loss)
print('Test Accuracy:', test_accuracy)
print('Computed Accuracy:', accuracy)

# Compute confusion matrix
confusion = confusion_matrix(true_labels, predicted_classes)

# Print confusion matrix in a good format
print("Confusion Matrix:")
print(confusion)

# Compute and print accuracy per class
class_accuracy = confusion.diagonal() / confusion.sum(axis=1)
class_names = list(test_generator.class_indices.keys())

print("\nAccuracy per class:")
for class_name, acc in zip(class_names, class_accuracy):
    print(f"{class_name}: {acc:.4f}")

# Plot training and validation accuracy
accuracy = history.history['accuracy']
val_accuracy = history.history['val_accuracy']
epochs = range(1, len(accuracy) + 1)

plt.plot(epochs, accuracy, 'bo-', label='Train')
plt.plot(epochs, val_accuracy, 'ro-', label='Validation')
plt.title('Training and Validation Accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend()
plt.show()