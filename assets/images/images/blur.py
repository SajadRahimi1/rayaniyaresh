from PIL import Image, ImageFilter

# Open the image
name=[
                                          "art2",
                                          "bcare",
                                          "educational",
                                          "helthcare",
                                          "office",
                                          "show",
                                          "tourism"
                                        ]
for image_name in name:
    image = Image.open(image_name+'.jpg')

    # Convert the image to RGBA mode
    image = image.filter(ImageFilter.GaussianBlur(radius=7))

    # Save the modified image
    image.save(image_name+'2.png')
