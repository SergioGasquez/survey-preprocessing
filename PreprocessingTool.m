clear all
close all 
%% AASR 
tic
ASSRPath='C:\Users\Sergio\Desktop\Seminar\Preproccess\ASSR\';
Files=ReadFileNames('s2');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);
     [R,L] = adaptive_single_scale_retinex(X,15);
     
     imPath=strcat(ASSRPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(ASSRPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     imwrite(uint8(R),imPath,'bmp') 
 end
Files=ReadFileNames('s1');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);
     [R,L] = adaptive_single_scale_retinex(X,15);
     
     imPath=strcat(ASSRPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(ASSRPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     imwrite(uint8(R),imPath,'bmp') 
 end
t_AASR=toc %25.9794;
%% HOMO
clear all
close all 
tic
HOMOPath='C:\Users\Sergio\Desktop\Seminar\Preproccess\HOMO\';
Files=ReadFileNames('s2');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     Y=normalize8(homomorphic(X,2,0.25, 2));
     
     imPath=strcat(HOMOPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(HOMOPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end

     imwrite(uint8(Y),imPath,'bmp')

 end

 Files=ReadFileNames('s1');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     Y=normalize8(homomorphic(X,2,0.25, 2));
     
     imPath=strcat(HOMOPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(HOMOPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end

     imwrite(uint8(Y),imPath,'bmp')

 end
t_HOMO=toc %2.2562
 %% SSSQI
clear all
close all 
tic
SSSQIPath='C:\Users\Sergio\Desktop\Seminar\Preproccess\SSSQI\';
Files=ReadFileNames('s2');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     [R,L]=single_scale_self_quotient_image(X,7,1);
     
     
     imPath=strcat(SSSQIPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(SSSQIPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     imwrite(uint8(R),imPath,'bmp') 

 end

Files=ReadFileNames('s1');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     [R,L]=single_scale_self_quotient_image(X,7,1);
     
     imPath=strcat(SSSQIPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(SSSQIPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     imwrite(uint8(R),imPath,'bmp') 

 end
 t_SSSQI=toc %7.5330
%% IS

clear all
close all 
tic
ISPath='C:\Users\Sergio\Desktop\Seminar\Preproccess\IS\';
Files=ReadFileNames('s2');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     Y = isotropic_smoothing(X);
  
     imPath=strcat(ISPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(ISPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     
     imwrite(uint8(Y),imPath,'bmp')


 end

Files=ReadFileNames('s1');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     Y = isotropic_smoothing(X);
     
     imPath=strcat(ISPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(ISPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     
     imwrite(uint8(Y),imPath,'bmp')
 end
 t_IS=toc %37.6993
 %% WF
clear all
close all 
tic
WFPath='C:\Users\Sergio\Desktop\Seminar\Preproccess\WF\';
Files=ReadFileNames('s2');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     Y = weberfaces(X);
     
     imPath=strcat(WFPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(WFPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end
     imwrite(uint8(Y),imPath,'bmp')

 end

Files=ReadFileNames('s1');
len=length(Files);
 for i=1:len
     image=char(Files(i));
     X=imread(image);     
     Y = weberfaces(X);
     
     imPath=strcat(WFPath,image);
     C = strsplit(image,'\');
     folderDir=strcat(WFPath,char(C(1)),'\',char(C(2)),'\',char(C(3)));
     if ~exist(folderDir,'dir')
        mkdir(folderDir);
     end

     imwrite(uint8(Y),imPath,'bmp')

 end
t_WF=toc %3.4942