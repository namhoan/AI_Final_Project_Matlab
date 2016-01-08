clear;clc;

load('label.mat')
load('ques_norm.mat')

A = tdfread('validation_set.tsv','\t');
B=cellstr(A.question);
a=0;

for i=1:size(A.question,1)
    k=1;
    for j=1:size(B{i},2)
        if B{i}(j) == '.' || B{i}(j) == '?' || B{i}(j) == ',' || B{i}(j) == '_'
            a=a+1;
        else
            A_pure(i,k)=B{i}(j);
%             clc;
            k=k+1;
%             a
        end
    end
    clc;
    i
end
A_cell = cellstr(A_pure);

for i=1:size(A_cell,1)
     C{i} = strsplit(A_cell{i});
end

A_noise = tdfread('noise.txt');
A_noise = cellstr(A_noise.aboard);

for i=1:length(C)
    for j=1:size(C{i},2)
        if length(C{i}{j})==0
            A_vec(i,j)=0;
        elseif sum(strcmp(C{i}{j},A_noise))>0
            A_vec(i,j)=0;
        else
            A_vec(i,j)=string2hash(C{i}{j},'sdbm');
        end
    end
   clc; i
end
save A_vec A_vec
clear
%%%%% Vectors for questions retrieved.

A = tdfread('validation_set.tsv','\t');
B=cellstr(A.answerA);
a=0;

for i=1:size(A.answerA,1)
    k=1;
    for j=1:size(B{i},2)
        if B{i}(j) == '.' || B{i}(j) == '?' || B{i}(j) == ',' || B{i}(j) == '_'
            a=a+1;
        else
            A_pure(i,k)=B{i}(j);
            k=k+1;
        end
    end
    clc;
    i
end
A_cell = cellstr(A_pure);

for i=1:size(A_cell,1)
     C{i} = strsplit(A_cell{i});
end

A_noise = tdfread('noise.txt');
A_noise = cellstr(A_noise.aboard);

for i=1:length(C)
    for j=1:size(C{i},2)
        if length(C{i}{j})==0
            Ans_A_vec(i,j)=0;
        elseif sum(strcmp(C{i}{j},A_noise))>0
            Ans_A_vec(i,j)=0;
        else
            Ans_A_vec(i,j)=string2hash(C{i}{j},'sdbm');
        end
    end
   clc; i
end
save Ans_A_vec Ans_A_vec
clear

%%%%%%%%%%%%%%%%%%% ans A done

A = tdfread('validation_set.tsv','\t');
B=cellstr(A.answerB);
a=0;

for i=1:size(A.answerB,1)
    k=1;
    for j=1:size(B{i},2)
        if B{i}(j) == '.' || B{i}(j) == '?' || B{i}(j) == ',' || B{i}(j) == '_'
            a=a+1;
        else
            A_pure(i,k)=B{i}(j);
            k=k+1;
        end
    end
    clc;
    i
end
A_cell = cellstr(A_pure);

for i=1:size(A_cell,1)
     C{i} = strsplit(A_cell{i});
end

A_noise = tdfread('noise.txt');
A_noise = cellstr(A_noise.aboard);

for i=1:length(C)
    for j=1:size(C{i},2)
        if length(C{i}{j})==0
            Ans_B_vec(i,j)=0;
        elseif sum(strcmp(C{i}{j},A_noise))>0
            Ans_B_vec(i,j)=0;
        else
            Ans_B_vec(i,j)=string2hash(C{i}{j},'sdbm');
        end
    end
   clc; i
end
save Ans_B_vec Ans_B_vec
clear

%%%%%%%%%%%%%%%%%%%%%%% Ans B done

A = tdfread('validation_set.tsv','\t');
B=cellstr(A.answerC);
a=0;

for i=1:size(A.answerC,1)
    k=1;
    for j=1:size(B{i},2)
        if B{i}(j) == '.' || B{i}(j) == '?' || B{i}(j) == ',' || B{i}(j) == '_'
            a=a+1;
        else
            A_pure(i,k)=B{i}(j);
            k=k+1;
        end
    end
    clc;
    i
end
A_cell = cellstr(A_pure);

for i=1:size(A_cell,1)
     C{i} = strsplit(A_cell{i});
end

A_noise = tdfread('noise.txt');
A_noise = cellstr(A_noise.aboard);

for i=1:length(C)
    for j=1:size(C{i},2)
        if length(C{i}{j})==0
            Ans_C_vec(i,j)=0;
        elseif sum(strcmp(C{i}{j},A_noise))>0
            Ans_C_vec(i,j)=0;
        else
            Ans_C_vec(i,j)=string2hash(C{i}{j},'sdbm');
        end
    end
   clc; i
end
save Ans_C_vec Ans_C_vec
clear

%%%%%%%%%%%%%%%%% Ans C done

A = tdfread('validation_set.tsv','\t');
B=cellstr(A.answerD);
a=0;

for i=1:size(A.answerD,1)
    k=1;
    for j=1:size(B{i},2)
        if B{i}(j) == '.' || B{i}(j) == '?' || B{i}(j) == ',' || B{i}(j) == '_'
            a=a+1;
        else
            A_pure(i,k)=B{i}(j);
            k=k+1;
        end
    end
    clc;
    i
end
A_cell = cellstr(A_pure);

for i=1:size(A_cell,1)
     C{i} = strsplit(A_cell{i});
end

A_noise = tdfread('noise.txt');
A_noise = cellstr(A_noise.aboard);

for i=1:length(C)
    for j=1:size(C{i},2)
        if length(C{i}{j})==0
            Ans_D_vec(i,j)=0;
        elseif sum(strcmp(C{i}{j},A_noise))>0
            Ans_D_vec(i,j)=0;
        else
            Ans_D_vec(i,j)=string2hash(C{i}{j},'sdbm');
        end
    end
   clc; i
end
save Ans_D_vec Ans_D_vec
clear

load('A_vec.mat')
load('Ans_A_vec.mat')
load('Ans_B_vec.mat')
load('Ans_C_vec.mat')
load('Ans_D_vec.mat')
load('ques_norm');
load('label');
for i=1:size(A_vec,1)
    val_ques_norm(i) = norm(A_vec(i,:));
    ansA_norm(i) = norm(Ans_A_vec(i,:));
    ansB_norm(i) = norm(Ans_B_vec(i,:));
    ansC_norm(i) = norm(Ans_C_vec(i,:));
    ansD_norm(i) = norm(Ans_D_vec(i,:));
end

for i=1:length(val_ques_norm)
    mat = val_ques_norm(i)*ones(1,length(ques_norm));
    diff = abs(ques_norm-mat);
    [M,IDX] = min(diff);
    prob_ans = label(IDX)*ones(1,4);
    ans_set = [ansA_norm(i) ansB_norm(i) ansC_norm(i) ansD_norm(i)];
    [ANS,ANS_IDX] = min(abs(ans_set-prob_ans));
    if ANS_IDX==1
        c_ans(i)='A';
    elseif ANS_IDX==2
        c_ans(i)='B';
    elseif ANS_IDX==3
        c_ans(i)='C';
    elseif ANS_IDX==4
        c_ans(i)='D';
    end
end

A = tdfread('validation_set.tsv','\t');
id = A.id;
for i=1:length(A.id)
    id_str = num2str(id(i));
    submission{i,1}= id_str;
    submission{i,2}= c_ans(i);
end
submission1=[{'id','correctAnswer'};submission];
temp=cell2dataset(submission1);
% temp.Properties.VarNames{1} = 'id';
% temp.Properties.VarNames{2} = 'correctAnswer';
export(temp,'file','submission.csv','delimiter',',');

% A = tdfread('sample_submission.csv','\t');
% for i=1:length(val_ques_norm)
%     ACC(i) = (A.id0x2CcorrectAnswer(i,8)==c_ans(i));
% end
% 
% Accuracy = sum(ACC)/length(val_ques_norm)
% %%%%%%%%%%%%%%%%%% Ans D done