D=imread("idata4.bmp")
imshow(D)
E=imread("rdata4.bmp")
imshow(E)
%ごま塩ノイズを白に統一して3×3で高輝度の一番低い値にする。
k=ones(512,2)*255;
D=[k D k];
b=ones(2,516)*255;
D=[b;D;b];
n=find(~D);
D(n)=255;
fun=@(x) min(x(:));
D2=nlfilter(D,[3 3],fun);
D2=D2(3:514,3:514)
imshow(D)
imshow(D2)
%ここまで
D3=medfilt2(D2,[5 5],'symmetric')
imshow(D3)
E=double(E);
D3=double(D3);
MSE=E-D3;
MSE=MSE.^2/numel(MSE);
MSE=sum(MSE);
MSE=sum(MSE)