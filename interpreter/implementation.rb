# User can convert his english sentences to Morze symbols, aswell, as convert 
# them backwards, by using the 'translate to' instuctions for compound 
# TranslaterExpression (which implements the expressions chain logic), or by 
# using the concrete EngExpression and MorzeExpression terminals 
# (don't use '.' and '-' symbols in English sentences).
# 
# CONTEXT Context
# EXPRESSIONS Expression: TranslaterExpression, EngExpression, MorzeExpression

require './expressions'

result1 = TranslaterExpression.new('Mister Sandman, bring me a dream! translate to Mor').interprete
result2 = TranslaterExpression.new("#{result1} translate to Eng").interprete
puts result1 # Morze interpreted sentence
puts result2 # Backward interpreted sentence
# Using the terminal expression straight forward:
puts MorzeExpression.new("Make him the cutest that I've ever seen").interprete