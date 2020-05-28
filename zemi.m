D=imread("idata4.bmp");
imshow(D)
E=imread("rdata4.bmp");
imshow(E)
%ごま塩ノイズを白に統一して3×3で高輝度の一番低い値にする。
k=ones(514,514)*255;
k(2:513,2:513)=D
n=find(~k);
k(n)=255;
fun=@(x) min(x(:));
D2=nlfilter(k,[3 3],fun);
D2=D2(2:513,2:513);
imshow(D2)
%ここまで
D3=medfilt2(D2,[5 5],'symmetric')
imshow(D3)
E=double(E);
D3=double(D3);
MSE=E-D3;
MSE=MSE.^2/numel(MSE);
MSE=sum(sum(MSE))