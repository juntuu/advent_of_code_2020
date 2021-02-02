# day 01 ######################################################################
END{print s[2020]RS B}x=s[2020-$0]{B=$0*x}{for(k in n)s[$0+k]=$0*k}n[$0]
# day 02 ######################################################################
BEGIN  {FS="[-: ]+"} END{print                 part1,part2}{x($NF);split(i,a,z)
part1  += $1 <= n  &&  n <= $2                 ;x(a[$1]a[$2]);$0="1-1";OFS="\n"
part2  += $1 >= n  &&  n >= $2                 }function x(s){n=gsub($3,i=s,s)}
# day 03 ######################################################################
BEGIN{FS=s[1]s[5]s[7]s[1,1]s[3];j=1}{gsub(/#/,1);for(k in s)f(substr(k,3));i++}
END{for(k in h)j*=h[k];print h[3]"\n"j}function f(y){h[k]+=i%++y<$(i/y*k%NF+1)}
# day 04 ######################################################################
BEGIN{f["ecl"]="amb|blu|brn|gr[yn]|hzl|oth";f["byr"]="19[2-9][0-9]|200[0-2]"
f["hgt"]="1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])(in)";f["pid"]="[0-9]{9}"
f["hcl"]="#[0-9abcdef]{6}";f["eyr"]="20(2[0-9]|30)";f["iyr"]="20(1[0-9]|20)"
RS=z}{for(k in f)if($0!~k":")next;part1++;for(i=1;i<=NF;i++){split($i,a,":")
if(a[1]in f&&a[2]!~"^("f[a[1]]")$")next}part2++}END{print part1;print part2}
# day 05 ######################################################################
function f(b,i){for(;b;b=substr(b,2))i=+i*2+substr(b,1,1);return i}END{print m
while(m in t)m--;print m}{gsub(/[FL]/,0);gsub(/[BR]/,1);x=f($0);x>m&&m=x;t[x]}
# day 06 ######################################################################
BEGIN {FS=RS;RS=z}{delete a
  for (;j=split($++i,y,z);)
 for  (;j;)A+=1>a[y[j--]]++
for   (j in a)B+=+a[j]==NF}
END   {print A;print B}i=!i
# day 07 ######################################################################
function f(b,x,u,s,c,n,a){sub(/[0-9]+ /,"",b);if(s[b])return 0;n=split(x[b],a,
RS);s[b]=u;for(;--n>0;)c+=a[n]*f(a[n],x,u,s,1);return c}!/no other b/{for(k=5;
k<NF;k+=2){o[b]=1FS$1"/"$2RS o[b=$++k"/"$++k];i[$1,$2]=$(k-2)" "b"\n"i[$1,$2]}
}BEGIN{SUBSEP="/"}END{print f("shiny/gold",o,"1 one");print f("shiny/gold",i)}
# day 08 ######################################################################
function f(i,s,h){for(;!h[++i]++&&s=C[i];){s~/a/&&A+=s;s~/j/&&i+=s-1}return i}
function hoo(k){return sub(/n/,"j",C[k])||sub(/j/,"n",C[k])}{C[NR]=$2$1}/n|j/{
K[NR]}END{f();print A;for(k in K){hoo(k);if(f(A=0)==NR+1)break;hoo(k)}print A}
# day 09 ######################################################################
til ( day = NR > 25 )    *!t{for(k in w)if(o=$0-k in w&&k<$0)break;o||t=$0}END{
while( on way to 50 *s    &&j<=o||p-t){while(p<t)p+=n[++j];while(p>t)p-=n[o++]}
no time; for( brute force  ;o<j;o++){z=n[o];z>a&&a=z;z<p&&p=z}$0=t" "a+p;OFS=RS
print out the stars $1, $2  }{w[n[NR]=$0]++}day&&--w[x=n[NR-25]]<1{delete w[x]}
# day 10 ######################################################################
 END  {adapter[max+=3];arrange[0]=1 # add builtin adapter & initial arrangement
 for  (;i++<max;)if(i in adapter){diff[i-prev]++;prev=i # update diff histogram
 for  (d=1;d<=3;d++)arrange[i]+=arrange[i-d]} # sum arrangement from prior ones
print (diff[1]*diff[3],arrange[max])} # day 10 ** done; time for morning coffee
BEGIN {OFS=RS} $1>max {max=$1} {adapter[$1]} # keep track of maximum & adapters
# day 11 ######################################################################
/#/{1/0}END{for(;++P<2;){for(s(S,A);$0;s(A,B)s(B,A))$0=0;for(k in A)$0+=A[k]
print}}BEGIN{FS=D[--P,P]D[P]D[P,1]D[0,P]D[0,1]D[1,P]D[1]D[1,1]}n=NR{for(i=0;
$++i;)$i~/L/?!S[n,i]++:++F[n,i]}function s(a,b){delete b;for(k in a)if(a[k])
for(d in D){for(split(k,x,zs=SUBSEP)split(d,y,zs);F[x[1]+=d,x[2]+=y[2]]*P;);
(r=x[1]zs x[2])in a&&b[r]++}for(k in a)$0+=a[k]?!(b[k]=b[k]<4+P):b[k]=!b[k]}
# day 12 ######################################################################
/N/ {sub(/N/,z);y+=$0;a+=$0}{j=a;n=substr($0,2);t=n/90}/L/{t=4-t}/E/{x+=n;b+=n}
/S/ {y-=n;a-=n}END{print f(y)+f(x)RS f(Y)+f(X)}function f(n){return n~/-/?-n:n}
/F/ {x+=n*d[h%=4];y+=n*d[7+h];Y+=n*a;X+=n*b}BEGIN{a=d[0]=d[b=10]=1;d[8]=--d[2]}
/W/ {x-=n;b-=n}/L|R/{h+=t;t<2&&(a=-b)(b=j);t==2&&(a=-j)(b=-b);t>2&&(a=b)(b=-j)}
# day 13 ######################################################################
/[xmas]/{next}!E{m=E=$0;RS=",";s=1;next}
function gcd(a,b){return b?gcd(b,a%b):a}
{for(;(t+NR-2)%$0;)t+=s;s*=$0/gcd(s,$0)}
END{print m*b"\n"t}m>w=$0-E%$0{m=w;b=$0}
# day 14 ######################################################################
function D (n){for(i=1+split(q,a,b=z);--i;n=int(n/2))b=(a[i]~"X"?n%2:a[i])b}
function A (a,b){sub(f,0,a)*sub(f,1,b)?A(a,a)A(b,b):Z[a]=$4}/mem/{q=m;D($4)}
function Y (b){i=split(b,a,n=z);for(k in a)n+=2^(i-k)*a[k]}/mem?/{X[t=$2]=b}
BEGIN{FS = " |\\["}!/mem/{m=$3;gsub(/X/,f="F");gsub(/0/,"X");M=$3}/mem/{q=M}
END{for( e in X)x+=Y(X[e])n;for(e in Z)y+=Z[e];print x"\n"y}/e/{D(t);A(b,b)}
# day 15 ######################################################################
function f(n){for(;i<n;i++){x=M[P];M[P]=i;P=x?i-x:0}print P}
BEGIN{FS=","}{for(;++i<NF;)M[$i]=i;P=$NF}END{f(2020);f(3e7)}
# day 16 ######################################################################
/yo/,/,/{FS=",";for(t=split($0,T);o++<N;)for(k in K)O[k,o]=1}/b/,0{for(i=e=0;
$++i;)e+=$i*!($i in R);E+=e}!t{K[$1];for(j=0;j++<4;)for(i=$++j;i<=$(1+j);i++)
F[$1,i]=1R[i];N++}!e{for(;$++e;)for(k in K)F[k,$e]||O[k,e]=0}END{for(D=p=1;p;
){p=0;for(k in K){for(n=i=0;i++<N;)n+=O[k,i]&&p=i;if(n==1){P[k]=p;for(k in K)
O[k,p]=0}}}for(k in P)k~/part?/&&D*=T[P[k]];print E"\n"D}BEGIN{FS=":| or |-"}
# day 17 ######################################################################
function C(o,n,w,a,y){if(n in d){for(y--;y<2;)C(o,n+1,w a d[n]+y++,s)}
else++o[w]}function game(g,n){for(k in g)split(k,d)C(n,1);for(k in g){
if(n[k]<3||n[k]>4)delete g[k];delete n[k]}for(k in n)3~n[k]&&g[k]}END{
for(FS=s;z++<6;)game(A)game(B);for(k in A)a++;for(k in B)b++;print a"\
"b}BEGIN{s=SUBSEP=FS;FS=z}{for(i=0;$++i;)$i~/#/&&A[NR,i,0]B[NR,i,0,0]}
# day 18 ######################################################################
function R(e,a,d) {return$a~1y?e+d:e*d}{gsub(/[day(XVIII)]/,x=" ! ")}
function E(v,a,l) {return+L(v,a,P(v,a))-!(i-=l)}{A+=E(y=i="[*]|[+]")}
function P(rin,t) {return!t||x~$++i?E(rin,!t,!t):$i}END{print A"\n"B}
function L(o,O,p) {return+O$++i~o?L(o,O,R(p,i,P(o,O))):p}{B+=E(i=0y)}
# day 19 ######################################################################
function f(i,n){$0="("R[i]")";for(R[i]=n;/[0-9]/;)for(i in R)gsub(" "i" ",
" ("R[i]") ");gsub(FS,z);y=$0}!NF{A=f(42,"A")y;B=f(31,"B")y;D=f(11,d="D")y
C=f(8,c="C")y;f(0)gsub(c,C)gsub(d,D)gsub(/A/,A)gsub(/B/,B);for(x=$0;C++<3;
)gsub(d,(a="("A B)"|"A d B")",y);gsub(d,a")",y);gsub(c,A"+",y)}gsub(/:|"/,
z){k=$1;$1=z;R[k]=$0 FS}END{print X"\n"Y}{X+=$0~"^("x")$";Y+=$0~"^("y")$"}
# day 20, only part 1 #########################################################
BEGIN{FS=RS;RS=z}{gsub(/\./,"~");id=substr($1,6,4);sub(/[^\n]*\n/,z)}
function M(y){return y"|"B(y)}{a=M($1)"|"M($NF)"|"M(I(1))"|"M(I(10))}
function I(n,f,o){for(;o++<NF;)f=f substr($o,n,1);return f}a{G[id]=a}
function B(r,o){for(i=length(r);i;)o=o substr(r,i--,1);return o}{P=1}
END{for(x in G){for(k in G)O[x]+=x-k&&G[k]~G[x];O[x]<3&&P*=x}print P}
# day 21 ######################################################################
BEGIN{FS=".\\(co.{7}|,.";P="\\|"}g=sub(/\)/,z){for(gsub(OFS,p="|");l=$++g;
s=z){for(y=split(A[l],c,P);x=c[y--];)x~"^("$1")$"&&s=s?s"|"x:x;A[l]=s?s:$1
}E=E"|"$1}END{$0=E;while(!q++)for(i in A){q=R[i]=A[i];if(q!~P){delete A[i]
for(k in A)sub(P q"|"q P,z,A[k])}gsub(P"("q")",p)}for(;q;){q=0;for(k in R)
k>q&&q=k;D=","R[q]D;delete R[q]}sub(/Day 21|../,RS,D);print gsub(P"+",z)D}
# day 22 ######################################################################
function T(c,n){t=substr(c,match(c,N"{"n"}"),RLENGTH)}function P(A,a,B,b,r,
s,x,y){for(;!s[A,B]++*a*b;w&&(B=B" "y" "x)(b+=2)||(A=A" "x" "y)(a+=2)){x=+A
y=+B;sub(N="( [0-9]+)",z,A)sub(N,z,B)a----b;w=x<y;r||a<x||b<y||P(T(A,x)t,x,
T(B,y)t,y,0)}w*=s[A,B]<2;if(r!~0){B=B A;r=0;for(a+=b;a;sub(N,z,B))r-=-a--*B
print r}}{X=gsub(/.*:.|\n/,FS)}A{P(A,X,$0,X,1)P(A,X,$0,X)}{A=$0}BEGIN{RS=z}
# day 23 ######################################################################
/Day fifteen/ ; I=m=split($0,Q,z){$0=C(100);for(i=1;1<i=A[i];)$0=$0i}I=1e6
/is it you!/ ; function C(u,p){delete A;for(;++p<m;x=Q[m])A[x=Q[p]]=Q[p+1]
/Or just a/ ; A[x]=m+1;for(A[I>m?I:Q[I]]=c=Q[1];++p<I;)A[p]=p+1;for(;u--||
/déjà vu,/ ; ){it[x=A[d=c]]it[A[x]]it[y=A[A[x]]];do--d||d=I;while(d in it)
/part 2?/ ; delete it;c=A[c]=A[y];A[y]=A[d];A[d]=x}}$0=C(1e7)+A[1]*A[A[1]]
# day 24 ######################################################################
K["sw"]=0(K["e"]=21){K["ne"]=201;I=K["nw"]=102;K["w"]=0(K["se"]=12)}END{for(\
;1<--I;){for(j in T){N[j]split(j,p);for(k in K){split(K[k],d,Z);N[j+d[1]-1s p\
[2]+d[2]-1s p[3]+d[3]-1]+=T[j]}}for(k in N)if(!(T[k]=T[k]N[k]~/11|2$/))delete \
T[k];delete N}for(k in T)B++;print A"\n"B}s=FS{for(gsub(/e|w/,j=x=y=z="& ");Z||
split(K[$++j],d,Z);)x=(x+d[1]-1)s (y+=d[2]-1)s (z+=d[3]-1);A+=2*(T[x]=!T[x])-1}
# day 25 ######################################################################
END{o[o[b]=a]=b;for(r=n=1;n!=a&&n!=b;e+=r)n=n*7%m;x=o[n];for(;e;
e/=2){e%2&&e--&&r=r*x%m;x=x*x%m}print r}!a{a=$1}m=20201227{b=$1}
