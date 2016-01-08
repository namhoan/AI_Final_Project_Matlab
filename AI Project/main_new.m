A = tdfread('training_set.tsv','\t');
B=cellstr(A.question);
BA_1 = cellstr(A.answerA);
BA_2 = cellstr(A.answerB);
BA_3 = cellstr(A.answerC);
BA_4 = cellstr(A.answerD);
for i=1:length(B)
    train.question(i)=string2hash(B{i});%/length(B{i});
    train.answerA(i)=string2hash(BA_1{i});%/length(BA_1{i});
    train.answerB(i)=string2hash(BA_2{i});%/length(BA_2{i});
    train.answerC(i)=string2hash(BA_3{i});%/length(BA_3{i});
    train.answerD(i)=string2hash(BA_4{i});%/length(BA_4{i});
end

CA = cellstr(A.correctAnswer);
for i=1:length(CA)
    if CA{i}=='A'
        train.CA_mat(i,:) = [1 0 0 0];
    elseif CA{i}=='B'
        train.CA_mat(i,:) = [0 1 0 0];
    elseif CA{i}=='C'
        train.CA_mat(i,:) = [0 0 1 0];
    elseif CA{i}=='D'
        train.CA_mat(i,:) = [0 0 0 1];
    end
end

answers = [train.answerA;train.answerB;train.answerC;train.answerD];
for i=1:length(train.question)
    train.learn_mat(i) = train.CA_mat(i,:)*answers(:,i);
end
save train train