def merge_sort(arr)
    return arr if arr.length == 1
    left, right = 0 , arr.length

    mid = (left + right) / 2
    left_array = merge_sort(arr[left..mid - 1])
    right_array = merge_sort(arr[mid..right - 1])
    sorting(left_array, right_array)
end

def sorting(one, two)
    i, j = 0, 0
    result = []
    while i < one.length and j < two.length 
        if one[i] < two[j]
            result.push(one[i])
            i += 1
        else    
            result.push(two[j])
            j += 1
        end
    end

    if i < one.length
        result += one[i..one.length - 1]
    else
        result += two[j..two.length - 1]
    end
    result
end

arr = [9, 8, 7, 3, 4, 2, 0, 1]
result = merge_sort(arr)
puts result.inspect