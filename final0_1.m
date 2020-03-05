f = [1 6 7 4 7 10];
h = [1 2 3];
a = (length(h)-1)/2;
offset = a + 1; % 마스크 가운데좌표 값 구하기 매트랩 인덱스를 위해


for x=1:length(f)
    m = 0;
    for s = -a:a 
        if (x+s <=0) || (x+s > length(f)) % f의 인덱스를 벗어나면 0으로 취급
            m = m + h(-s+offset) * 0; 
        else
            m = m + h(-s+offset) * f(x+s); % 나머지는 기본 수식대로
        end
    end
    g(x) = m;
end

g