# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    s.each_char do |c|
        if c == '(' || c == '{' || c == '['
            stack.push(c)
        else
            return false if stack.empty?
            if c == ')' && stack.pop != '('
                return false
            elsif c == '}' && stack.pop != '{'
                return false
            elsif c == ']' && stack.pop != '['
                return false
            end
        end
    end
    return stack.empty?
end

test_cases = [
    ["()", true],
    ["()[]{}", true],
    ["(]", false],
    ["([)]", false],
    ["{[]}", true],
    ["", true],
    ["(", false],
    [")", false],
    ["[", false],
    ["]", false],
    ["{", false],
    ["}", false],
    ["(]", false],
    ["([)]", false],
    ["{[]}", true],
    ["", true],
    ["(", false],
    [")", false],
    ["[", false],
    ["]", false],
    ["{", false],
    ["}", false],
    ["(]", false],
    ["([)]", false],
    ["{[]}", true],
    ["", true],
    ["(", false],
    [")", false],
]

test_cases.each do |test_case|
    input, expected = test_case
    actual = is_valid(input)
    if actual == expected
        puts "PASS"
    else
        puts "FAIL: input: #{input}, expected: #{expected}, actual: #{actual}"
    end
end
