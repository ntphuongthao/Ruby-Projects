def fibs_rec(n)
    [1] if n == 1
    [1, 1] if n == 2
    add = fibs_rec(n - 1)
    add + [add[-2] + add[-1]]
end

res = fibs_rec(8)
puts res.inspect