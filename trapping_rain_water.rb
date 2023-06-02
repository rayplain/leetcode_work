# @param {Integer[]} height
# @return {Integer}
def trap(height)
    return 0 if height.empty?
    left = 0
    right = height.length - 1
    left_max = height[left]
    right_max = height[right]
    water = 0
    while left < right
        if height[left] < height[right]
            left += 1
            left_max = [left_max, height[left]].max
            water += left_max - height[left]
        else
            right -= 1
            right_max = [right_max, height[right]].max
            water += right_max - height[right]
        end
    end
    water

end
