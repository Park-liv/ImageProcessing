f = [1 6 7 4 7 10];
h = [1 2 3];
a = (length(h)-1)/2;
offset = a + 1; % ����ũ �����ǥ �� ���ϱ� ��Ʈ�� �ε����� ����


for x=1:length(f)
    m = 0;
    for s = -a:a 
        if (x+s <=0) || (x+s > length(f)) % f�� �ε����� ����� 0���� ���
            m = m + h(-s+offset) * 0; 
        else
            m = m + h(-s+offset) * f(x+s); % �������� �⺻ ���Ĵ��
        end
    end
    g(x) = m;
end

g