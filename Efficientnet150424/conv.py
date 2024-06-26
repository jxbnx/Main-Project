import tensorflow as tf

def convert_h5_to_tflite(h5_path, tflite_path):
    # Load the model from the HDF5 file
    model = tf.keras.models.load_model(h5_path)

    # Convert the model to TensorFlow Lite format
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    tflite_model = converter.convert()

    # Save the TFLite model to a file
    with open(tflite_path, 'wb') as f:
        f.write(tflite_model)

# Specify the paths for your HDF5 and TFLite files
h5_file_path = 'efficientnetb3_model.h5'
tflite_file_path = 'converted_model.tflite'

# Call the function to convert the HDF5 model to TFLite
convert_h5_to_tflite(h5_file_path, tflite_file_path)
