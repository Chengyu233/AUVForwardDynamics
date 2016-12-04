function plot_bot_global(fname,phi,theta,si,Xcm,Ycm,Zcm,input_data)
%function for drawing the bot at different time instants

%R=rotation matrix
R=[cos(si)*cos(theta) -sin(si)*cos(phi)+cos(si)*sin(theta)*sin(phi) sin(si)*sin(phi)+cos(si)*cos(phi)*sin(theta);
   sin(si)*cos(theta) cos(si)*cos(phi)+sin(phi)*sin(theta)*sin(si) -cos(si)*sin(phi)+sin(theta)*sin(si)*cos(phi);
  -sin(theta)         cos(theta)*sin(phi)                          cos(theta)*cos(phi)                         ;];

poscm=[Xcm;Ycm;Zcm];


   [row1,col1]=size(input_data) ;
   output_data=zeros(row1,col1);
   
   for i=1:row1
       temp(1,1)=input_data(i,1);
       temp(2,1)=input_data(i,2);
       temp(3,1)=input_data(i,3);
       
       output_data(i,:)=(R*temp+poscm)';
   end
   
fname2=['Global_bot_coordinates_case_',fname,'.csv'] ;
fid2=fopen(fname2,'a');
dlmwrite(fname2,output_data,'roffset',1,'coffset',0,'-append');
fclose(fid2) ;
end
