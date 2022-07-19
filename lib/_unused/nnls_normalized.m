function x = nnls_normalized(inputMatrix)
    addpath('./lib/');

    strng = sprintf('\nLoading input matrix ...\n');
    disp(strng);
    
%    c = readmatrix('../output/PRE_nnls_full_input.xlsx');
    fullInputFileName = strcat('./data/', inputMatrix);
    c = readmatrix(fullInputFileName);
    count = 0;
    for r1=1:94
        for c1=1:5
            count = count + c(r1,c1);
        end
    end
    for r2=1:94
        for c2=1:5
            c(r2,c2) = c(r2,c2)/count;
        end
    end
    d = [0.01314409143	0.003585454286	0.001582562857	0.0005751971429	0.000000002857142857	0.0180307	0.00004379714286	0.06092456143	0.001159768571	0.0000007142857143	0.01848947286	0	0	0.00000001857142857	0.00000008571428571	0.0001796342857	0.0000008485714286	0.000001047142857	0.0004775	0.00000003285714286	0.0000006742857143	0	0.000002394285714	0	0.00000004142857143	0	0.000004485714286	0.000002657142857	0.001945914286	0	0.0001306628571	0	0.0000001171428571	0	0.00016813	0.00076781	0.0004392628571	0.000008998571429	0.00000003428571429	0.0000001671428571	0	0.00005275428571	0	0.0002622657143	0	0.000008492857143	0.0002269728571	0.009937	0.0000002071428571	0.00001238714286	0.000007381428571	0.003494044286	0.0000005714285714	0.000000002857142857	0.00001779142857	0	0	0	0	0.000000001428571429	0.000001797142857	0.0000005485714286	0.00000007142857143	0.00000001571428571	0	0	0.000000002857142857	0	0	0.00000008714285714	0.000000002857142857	0.0000001857142857	0	0	0	0	0	0	0.00000003428571429	0.000003218571429	0.00001321285714	0.00004547285714	0.00000004714285714	0	0.000001101428571	0.00001767285714	0.0000002771428571	0.000001654285714	0.00000022	0.0000007657142857	0.00000009571428571	0	0.00009134	0];
    %d = [0.042620; 0.000017; 0.007780; 0.001179; 0.013136; 0.000091; 0.001677; 0.000704; 0.000047; 0.000301];
    sum = 0;
    new_d = zeros(94, 1);
    for y=1:94
        sum = d(y) + sum;
    end
    for x=1:94
        new_d(x) = d(x)/sum;
    end
       
    [x, resnorm] = lsqnonneg(c, new_d);  
    %num = lsqminnorm(c,new_d)
    %n = norm(c*x - new_d);

    
end
%d = [0.01314409143	0.003585454286	0.001582562857	0.0005751971429	0.000000002857142857	0.0180307	0.00004379714286	0.06092456143	0.001159768571	0.0000007142857143	0.01848947286	0	0	0.00000001857142857	0.00000008571428571	0.0001796342857	0.0000008485714286	0.000001047142857	0.0004775	0.00000003285714286	0.0000006742857143	0	0.000002394285714	0	0.00000004142857143	0	0.000004485714286	0.000002657142857	0.001945914286	0	0.0001306628571	0	0.0000001171428571	0	0.00016813	0.00076781	0.0004392628571	0.000008998571429	0.00000003428571429	0.0000001671428571	0	0.00005275428571	0	0.0002622657143	0	0.000008492857143	0.0002269728571	0.009937	0.0000002071428571	0.00001238714286	0.000007381428571	0.003494044286	0.0000005714285714	0.000000002857142857	0.00001779142857	0	0	0	0	0.000000001428571429	0.000001797142857	0.0000005485714286	0.00000007142857143	0.00000001571428571	0	0	0.000000002857142857	0	0	0.00000008714285714	0.000000002857142857	0.0000001857142857	0	0	0	0	0	0	0.00000003428571429	0.000003218571429	0.00001321285714	0.00004547285714	0.00000004714285714	0	0.000001101428571	0.00001767285714	0.0000002771428571	0.000001654285714	0.00000022	0.0000007657142857	0.00000009571428571	0	0.00009134	0];
%old d = [0.007346001633	0.002537482041	0.000657717551	0.0003882785714	0.0000000004081632653	0.006952566327	0.00001742959184	0.0426152149	0.0008754208163	0.0000002106122449	0.0103616798	0	0	0.00000000693877551	0.00000006244897959	0.00005089387755	0.0000002081632653	0.0000004604081633	0.0002892342857	0.00000001653061224	0.00000039	0	0.000001323673469	0	0.00000001653061224	0	0.000001534693878	0.0000008440816327	0.0007528893878	0	0.0000471777551	0	0.00000003673469388	0	0.0001077281633	0.0004840344898	0.0002482922449	0.00000367244898	0.000000004897959184	0.00000003244897959	0	0.00001981877551	0	0.0000912244898	0	0.000004121632653	0.0001261822449	0.002559123878	0.00000005	0.00000471122449	0.000003357959184	0.003018457143	0.00000009693877551	0.0000000004081632653	0.000005231020408	0	0	0	0	0.0000000004081632653	0.0000003918367347	0.0000002244897959	0.00000003183673469	0.000000004897959184	0	0	0.0000000008163265306	0	0	0.00000003591836735	0.000000003673469388	0.00000007102040816	0	0	0	0	0	0	0.000000005510204082	0.000001157142857	0.000002635714286	0.000007383469388	0.00000001510204082	0	0.0000006942857143	0.00000826122449	0.0000001224489796	0.0000006685714286	0.0000001102040816	0.0000002920408163	0.0000000493877551	0	0.00004719673469	0]