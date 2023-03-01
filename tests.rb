square = [3.0,3.0]
results = []


(0..7).each do |x|
    (0..7).each do |y|
       results << "for #{x},#{y} --- #{((y- square[1])**2 + (x - square[0])**2)**(1/2.0)}"

    end
end

#Para el caballo, se quieren distnacias de raiz de 2 (1.44) y raiz de 5 (2,23)