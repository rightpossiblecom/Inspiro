from PIL import Image, ImageDraw, ImageFont
import os

def create_feature_graphic():
    # 1024x500 Feature Graphic
    width, height = 1024, 500
    img = Image.new('RGB', (width, height), color = (255, 255, 255))
    d = ImageDraw.Draw(img)
    
    # Gradient Background (Purple to Pink)
    # Similar logic to logo but linear
    for x in range(width):
        ratio = x / width
        red = int(108 * (1 - ratio) + 255 * ratio)
        green = int(99 * (1 - ratio) + 101 * ratio)
        blue = int(255 * (1 - ratio) + 132 * ratio)
        
        d.line([(x, 0), (x, height)], fill=(red, green, blue))
        
    # Ideally add text "Inspiro" here, but without font file it's hard.
    # Just keeping it simple gradient for now.
    
    # Ensure directory exists
    if not os.path.exists('docs/release'):
        os.makedirs('docs/release')
        
    img.save('docs/release/featured_graphic_inspiro.png')
    print("Feature Graphic generated at docs/release/featured_graphic_inspiro.png")

if __name__ == "__main__":
    create_feature_graphic()
