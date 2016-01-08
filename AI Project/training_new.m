load('train.mat')
A = tdfread('validation_set.tsv','\t');
B=cellstr(A.question);
BA_1 = cellstr(A.answerA);
BA_2 = cellstr(A.answerB);
BA_3 = cellstr(A.answerC);
BA_4 = cellstr(A.answerD);

for i=1:length(B)
    test.question(i)=string2hash(B{i});%/length(B{i});
    test.answerA(i)=string2hash(BA_1{i});%/length(BA_1{i});
    test.answerB(i)=string2hash(BA_2{i});%/length(BA_2{i});
    test.answerC(i)=string2hash(BA_3{i});%/length(BA_3{i});
    test.answerD(i)=string2hash(BA_4{i});%/length(BA_4{i});
end

test.answers = [test.answerA;test.answerB;test.answerC;test.answerD]';

for i=1:length(test.question)
    temp_q = test.question(i)*ones(1,length(train.question));
    temp_diff = abs(temp_q-train.question);
    [diff index] = min(temp_diff);
    temp_ans = train.learn_mat(index);
    temp_ans_diff = abs(temp_ans*ones(1,4) - test.answers(1,:));
    [dif idx] = min(temp_ans_diff);
    if idx==1
        test.CA_mat(i)='A';
    elseif idx==2
        test.CA_mat(i)='B';
    elseif idx==3
        test.CA_mat(i)='C';
    elseif idx==4
        test.CA_mat(i)='D';
    end
end

id = A.id;
for i=1:length(A.id)
    id_str = num2str(id(i));
    submission{i,1}= id_str;
    submission{i,2}= test.CA_mat(i);
end

submission1=[{'id','correctAnswer'};submission];
temp=cell2dataset(submission1);
% temp.Properties.VarNames{1} = 'id';
% temp.Properties.VarNames{2} = 'correctAnswer';
export(temp,'file','submission_new.csv','delimiter',',');