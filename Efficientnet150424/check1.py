import tensorflow as tf
from PIL import Image

def load_and_preprocess_image(image_path, input_shape):
    # Load the image using PIL
    img = Image.open(image_path)
    
    # Resize the image to match the expected input shape
    img = img.resize((input_shape[1], input_shape[2]))
    
    # Convert the image to a NumPy array
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    
    # Expand the dimensions to create a batch of size 1
    img_array = tf.expand_dims(img_array, 0)
    
    return img_array

def predict_image_class(image_path, interpreter):
    # Load and preprocess the image
    input_details = interpreter.get_input_details()
    input_shape = input_details[0]['shape']
    img = load_and_preprocess_image(image_path, input_shape)

    # Set the input tensor
    interpreter.set_tensor(input_details[0]['index'], img)

    # Run the inference
    interpreter.invoke()

    # Get the output tensor
    output_details = interpreter.get_output_details()
    output = interpreter.get_tensor(output_details[0]['index'])

    # Process the output (assuming classification task)
    predicted_class = tf.argmax(output[0]).numpy()

    return predicted_class

# Specify the paths for your TFLite model and input image
tflite_model_path = 'xefnetb3_m1_tflite.tflite'
image_path = 'leafcurl.jpg'

# Load the TFLite model
interpreter = tf.lite.Interpreter(model_path=tflite_model_path)
interpreter.allocate_tensors()

# Call the function to predict the class of the input image
predicted_class = predict_image_class(image_path, interpreter)
print("Predicted Class:", predicted_class)
