function quickSort(A)
    if #A <= 1 then
        return A
    else
        less = {}
        eq = {A[1]}
        greater = {}
        for i=2, #A do
            currElem = A[i]
            if A[i] < A[1] then
                table.insert(less, currElem)
            elseif A[i] == A[i] then
                table.insert(eq, currElem)
            else
                table.insert(greater, currElem)
            end
        end

        less = quickSort(less)
        greater= quickSort(greater)

        concat = {}
        for i=1, #less do
            table.insert(concat, less[i])
        end
        for i=1, #eq do
            table.insert(concat, eq[i])
        end
        for i=1, #greater do
            table.insert(concat, greater[i])
        end
        return concat
    end
end
