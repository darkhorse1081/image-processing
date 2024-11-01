function [isBlue] = IsPixelBlue(red,green,blue)

isBlue = false;

    if ((red < 128) && (green < 128) && (blue > 128))
        isBlue = true;
    end

end

