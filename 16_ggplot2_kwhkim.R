install.packages('ggplot2')
install.packages('dplyr')

library(ggplot2)
library(dplyr)

## 16 ggplot2

## 16.1 들어가기

## 16.2 시각적 맵핑


data(mpg, package='ggplot2')


ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point()


# ggplot(data= , aes(x=  , y=   , col=  , size=  , shape=   )) +
#   geom_point()


# ggplot(data, aes(x=  , y=   , col=  , size=  , shape=   )) +
#   geom_point() +
#   geom_line()


# ggplot(data, aes(x=  , y=   , col=  , size=  , shape=   )) +
#   geom_point() +
#   geom_line() +
#   geom_smooth(method='lm/glm/gam/loess/MASS::rlm', span=  , formula=  )


ggplot(mpg, aes(x=class, y=cty)) + geom_point() +
  labs(subtitle = '+ geom_point()')
ggplot(mpg, aes(x=class, y=cty)) + geom_jitter(width=0.2) + 
  labs(subtitle = '+ geom_jitter(width=0.2)')
ggplot(mpg, aes(x=class, y=cty)) + geom_boxplot() +
  labs(subtitle = '+ geom_boxplot()')
ggplot(mpg, aes(x=class, y=cty)) + geom_violin() + 
  labs(subtitle = '+ geom_violin()')


# ggplot(data = , aes(x= )) + geom_histogram(bins=  , binwidth=  , breaks=  )
# ggplot(data = , aes(x= )) + geom_freqpoly(bins=  , binwidth=  , breaks=  )



ggplot(data = mpg, aes(x=cty)) + geom_histogram(bins= 30) + labs(subtitle=' + geom_histogram(bins=30)')
ggplot(data = mpg, aes(x=cty)) + geom_freqpoly(bins= 30) + labs(subtitle=' + geom_frequency(bins=30)') 


ggplot(data = mpg, aes(x=cty)) + geom_histogram(binwidth= 5) + 
  labs(subtitle = '+ geom_histogram(binwidth=5)')
ggplot(data = mpg, aes(x=cty)) + geom_freqpoly(binwidth= 5) +
  labs(subtitle = '+ geom_freqpoly(binwidth=5)')


ggplot(data = mpg, aes(x=cty)) + geom_histogram(breaks= c(0,5,10,15:25,45)) + 
  labs(subtitle='+ geom_histogram(breaks=c(0,5,10,15:25,45))')
ggplot(data = mpg, aes(x=cty)) + geom_freqpoly(breaks= c(0,5,10,15:25,45)) + 
  labs(subtitle='+ geom_freqpoly(breaks=c(0,5,10,15:25,45))')



ggplot(data=mpg, aes(x=class)) + geom_bar(col='blue', fill='red') + 
  labs(subtitle="+ geom_bar(col='blue', fill='red')")



data(mpg, package='ggplot2')
dat <- table(mpg$class)
df <- as.data.frame(dat)
colnames(df) = c('name', 'n')
print(head(df))
ggplot(df, aes(x=name, y=n)) + geom_bar(stat='identity') + 
  labs(subtitle="+ geom_bar(stat='identity')")
ggplot(df, aes(x=name, y=n)) + geom_col() + 
  labs(subtitle="+ geom_col()")


## 16.2.1 시각적 맵핑의 구체적 방법: 스케일

g <- ggplot(mpg, aes(x = fl, fill= fl)) + geom_bar() 
g
g + labs(subtitle=' ')
g + scale_fill_manual(
  values = c("orange", "skyblue", "royalblue", "blue", "navy")) +
  labs(subtitle="+ scale_fill_manual(values = c(\"orange\", \"skyblue\", \"royalblue\", \"blue\", \"navy\"))")
g + scale_fill_manual(
  values = c("orange", "skyblue", "royalblue", "blue", "navy"),
  breaks = c("e", "p")) + 
  labs(subtitle='+ scale_fill_manual(breaks=c("e", "p"))')
g + scale_fill_manual(
  values = c("orange", "skyblue", "royalblue", "blue", "navy"),
  breaks = c('e', 'p'),
  labels = c("Ethanol", "Premium")) + 
  labs(subtitle='+ scale_fill_manual(labels = c("Ethanol", "Premium"))')
g + scale_fill_manual(
  values = c("orange", "skyblue", "royalblue", "blue", "navy"),
  breaks = c('e', 'p'),
  labels = c("Ethanol", "Premium"),
  name = "fuel type") + 
  labs(subtitle='+ scale_fill_manual(name = "fuel type")')
g + scale_fill_manual(
  values = c("orange", "skyblue", "royalblue", "blue", "navy"),
  limits = c('e', 'p'),
  breaks = c('e', 'p'),
  labels = c("Ethanol", "Premium"),
  name = "fuel type") + 
  labs(subtitle = '+ scale_fill_manual(limits = c("e", "p"))')



mpg$yr = as.Date(as.character(mpg$year), "%Y")
mpg2 = mpg %>% filter(manufacturer %in% c("audi", "dodge", "ford", "jeep"))
ggplot(mpg2, aes(x=yr, y=displ, col=manufacturer)) + 
  geom_jitter() + labs(subtitle = '+ scale_x_date(date_labels="%Y")') +
  scale_x_date(date_labels="%Y")
ggplot(mpg2, aes(x=yr, y=displ, col=manufacturer)) + 
  geom_jitter() + labs(subtitle = '+ scale_x_date(date_labels="%y-%m")') +
  scale_x_date(date_labels="%y-%m")
ggplot(mpg2, aes(x=yr, y=displ, col=manufacturer)) + 
  geom_jitter() + 
  scale_x_date(date_labels="%y",
               date_breaks="1 year") +
  labs(subtitle='+ scale_x_date(date_labels="%y",
  date_breaks="1 year")')
ggplot(mpg2, aes(x=yr, y=displ, col=manufacturer)) + 
  geom_jitter() + 
  scale_x_date(date_labels="%y",
               date_breaks="2 years") + labs(subtitle='+ scale_x_date(date_labels="%y",
  date_breaks="2 years")')


g <- ggplot(mpg, aes(x=displ, y=hwy, col=drv)) + 
  geom_jitter() 
g + labs(title=' ')
g + scale_color_manual(values=c('red','orange', 'blue')) + labs(title='+ scale_color_manual()')
g + scale_color_grey(start=0.2, end=0.8, na.value='red') + labs(title='+ scale_color_grey(start=0.2, end=0.8, na.value="red")')
g + scale_color_brewer(palette = "Dark2") + labs(title='+ scale_color_brewer(palette="Dark2")')


## 16.2.2 팔레트

RColorBrewer::display.brewer.all()

install.packages('colorspace')

library(colorspace)

pal <- choose_palette()


if (file.exists("palette.RData")) {
  load(file='palette.RData')
} else {
  pal <- choose_palette()
  save(pal, file="palette.RData")
}



library(colorspace)
g + scale_color_discrete_qualitative(palette='Dark3') +
  labs(subtitle="+scale_color_discrete_qualitative(palette='Dark3')")
g + scale_color_discrete_diverging(palette='Berlin') +
  labs(subtitle="+scale_color_discrete_diverging(palette='Berlin')")



hcl_palettes(plot = TRUE)
               
## 16. 2. 3 x-위치, y-위치 스케일

h <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_jitter(alpha=0.5) 
h + labs(subtitle=' ')
#h + scale_y_log10(breaks=seq(10, 50, 10)) + labs(title='+ scale_y_log10(breaks=seq(10, 50, 0.1))')
h + scale_x_reverse() + labs(subtitle = '+ scale_x_reverse()')
h + scale_x_sqrt() + labs(subtitle = '+ scale_x_sqrt()')
h + scale_y_log10(breaks=seq(10,50,10),
                  limits = c(20,40),
                  labels=c('ten', 'twenty','thirty', 'fourty','fifty'),
                  name='highway(miles/gallon)') + 
  labs(subtitle="+ scale_y_log10(breaks=seq(10,50,10),
limits = c(20,40),
labels=c('ten', 'twenty','thirty', 'fourty','fifty'),
name='highway(miles/gallon)')")


## 16. 2. 4 퍼시팅

t <- ggplot(mpg, aes(cty, hwy)) + geom_point()
t + labs(subtitle=' ')
t + facet_grid(. ~ drv) + labs(subtitle='+ facet_grid(. ~ drv)')
t + facet_grid(drv ~ .) + labs(subtitle='+ facet_grid(drv ~ .)')
t + facet_grid(year ~ drv) + labs(subtitle='+ facet_grid(year ~ drv)')
t + facet_grid(.~ drv + year) + labs(subtitle='+ facet_grid(.~ drv + year)')
t + facet_grid(drv + year ~ .) + labs(subtitle='+ facet_grid(drv + year ~ .)')
t + facet_wrap(~ drv) + labs(subtitle='+ facet_wrap(~ drv)')
t + facet_wrap(~ drv + year) + labs(subtitle='+ facet_wrap(~ drv + year)')


t+ facet_grid(drv ~ year, scales = "free")
t + facet_grid(drv ~ year, scales = "free_x") + labs(subtitle='+ facet_grid(drv ~ year, scales = "free_x")')
t + facet_grid(drv ~ year, scales = "free_y") + labs(subtitle='+ facet_grid(drv ~ year, scales = "free_y")')


t + labs(subtitle=' ')
t + facet_grid(drv ~ ., labeller = label_both) + labs(subtitle='labeller = label_both')
t + facet_grid(drv ~ ., labeller = label_bquote(alpha ^ .(drv))) + labs(subtitle='labeller = label_bquote(alpha ^ .(drv))')

## 16. 2. 5 모양

mpg4 <- mpg %>% filter(manufacturer %in% 
                         c('audi', 'dodge', 'ford', 'honda', 'hyundai', 'jeep', 'toyota'))
g <- ggplot(mpg4, aes(x=displ, y=hwy, shape=manufacturer)) + 
  geom_jitter() 
g + labs(subtitle=" ")
g + scale_shape_manual(values=c(1,2,3,4,15,16,17)) + 
  labs(subtitle="+ scale_shape_manual(values=c(1,2,3,4,15,16,17))")
g + scale_shape_manual(values=c(1,2,3,4,15,16,17),
                       breaks=c('audi', 'dodge', 'ford')) + 
  labs(subtitle="
+ scale_shape_manual(values=c(1,2,3,4,15,16,17)),
  breaks=c('audi', 'dodge', 'ford'))")
g + scale_shape_manual(limits=c('audi','dodge','ford'),
                       values=c(1,2,3),
                       breaks=c('audi', 'dodge', 'ford')) + 
  labs(subtitle="+ scale_shape_manual(limits=c('audi','dodge','ford'),
  values=c(1,2,3),
  breaks=c('audi', 'dodge', 'ford'))")


## 16. 3 기하학적 대상

c <- ggplot(mpg, aes(x = hwy))
c + geom_histogram(binwidth = 5) + labs(title='+ geom_histogram(binwidth = 5)')
c + geom_area(stat = "bin") + labs(title='+ geom_area(stat = "bin")')
c + geom_density(kernel = "gaussian") + labs(title='+ geom_density(kernel = "gaussian")')
c + geom_dotplot(binwidth=0.6) + labs(title='+ geom_dotplot(binwidth=0.6)')
c + geom_freqpoly() + labs(title='+ geom_freqpoly()')
c2 <- ggplot(mpg)
c2 + geom_qq(aes(sample=hwy)) + labs(title='+ geom_qq(aes(sample=hwy))')

d <- ggplot(mpg, aes(fl))
d + geom_bar()

## 16. 3. 2 이산형 일변수

install.packages('quantreg')

library(quantreg)

e <- ggplot(mpg, aes(cty, hwy))
e + geom_label(aes(label = cty), nudge_x = 1, nudge_y = 1) + labs(subtitle='+ geom_label(aes(label = cty), nudge_x = 1, nudge_y = 1)')
e + geom_jitter(height = 2, width = 2) + labs(subtitle='+ geom_jitter(height = 2, width = 2)') 
e + geom_point() + labs(subtitle='+ geom_point()')
e + geom_quantile() + labs(subtitle='+ geom_quantile()')
e + geom_rug(sides = "bl") + labs(subtitle='+ geom_rug(sides = "bl")')
e + geom_smooth(method = lm) + labs(subtitle='+ geom_smooth(method = lm)')
e + geom_text(aes(label = cty), nudge_x = 1, nudge_y = 1, check_overlap = TRUE) + labs(subtitle='+ geom_text(aes(label = cty),
  nudge_x = 1, nudge_y = 1, 
  check_overlap = TRUE)')


e + geom_jitter(height=2, width=2, alpha=0.5, size=2) +
  geom_quantile(quantiles=c(0.05, 0.95)) + 
  geom_rug(sides = 'tr') +  # top, bottom, left, right
  geom_smooth(method=lm, size=2, se=FALSE) +
  labs(subtitle = '+ geom_jitter(height=2, width=2, alpha=0.5, size=2) +
geom_quantile(quantiles=c(0.05, 0.95)) +
geom_rug(sides = \'tr\') +
geom_smooth(method=lm, size=2, se=F)')


e2 <- e + geom_jitter(height=2, width=2, alpha=0.5, size=2) +
  geom_rug(sides = 'tr')  # top, bottom, left, right
e2 + geom_quantile(method='rqss')
e2 + geom_quantile(method='rqss', lambda = 10)
# geom_quantile(method='rqss', quantiles=c(0.05, 0.95))


## 16.3.4 이변수 : x=이산형, y=연속형

f <- ggplot(mpg, aes(class, hwy))
f + geom_col() + labs(subtitle='+ geom_col()')
f + geom_boxplot(alpha=0.5) + labs(subtitle='+ geom_boxplot(alpha=0.5)')
f + geom_dotplot(binaxis = "y", stackdir = "center", binwidth=0.7) + labs(subtitle='+ geom_dotplot(binaxis = "y",\nstackdir = "center", binwidth=0.7)')
f + geom_violin(scale = "area") + labs(subtitle='+ geom_violin(scale = "area")
')


f <- ggplot(mpg, aes(class, hwy))
f + geom_boxplot(alpha=0.5) + 
  geom_dotplot(binaxis = "y", stackdir = "center", binwidth=1, alpha=0.5) + 
  labs(subtitle='+ geom_boxplot(alpha=0.5) + 
geom_dotplot(binaxis = "y", stackdir = "center", 
binwidth=1, alpha=0.5)')
f + geom_jitter(alpha=0.5, width=0.1, height=0.1) + geom_boxplot(alpha=0.5) + labs(subtitle='+ geom_jitter(alpha=0.5,width=0.1,height=0.1)+
geom_boxplot(alpha=0.5)
')


## 16. 3. 5 이변수: x=이산형, y=이산형

g <- ggplot(diamonds, aes(cut, color))
g + geom_count() + labs(title= '+ geom_count()')
g + geom_jitter() + labs(title= '+ geom_jitter()')


g <- ggplot(diamonds, aes(cut, color))
#g + geom_jitter(alpha=0.1) + labs(title='+ geom_jitter(alpha=0.1)')
g + geom_jitter(alpha=0.02) + labs(title='+ geom_jitter(alpha=0.02)')
g + geom_jitter(shape='.') + labs(title='+ geom_jitter(shape=\'.\')')


## 16. 3. 6 이변수 분포

install.packages("hexbin")

library(hexbin)
h <- ggplot(diamonds, aes(carat, price)) 
h + geom_bin2d(binwidth = c(0.25, 500)) + labs(title='+ geom_bin2d(binwidth = c(0.25, 500))')
h + geom_density2d() + labs(title='+ geom_density2d()')
h + geom_hex() + labs(title='+ geom_hex()')
h + geom_point(alpha=0.2) + 
  stat_ellipse(level=0.95, col="red") + 
  stat_ellipse(level=0.01, col="red", size=3) + labs(title='+ geom_point(alpha=0.2) + 
stat_ellipse(level=0.95, col="red") + 
stat_ellipse(level=0.01, col="red", size=3)')



ggplot(diamonds, aes(carat, color)) + geom_bin2d()
ggplot(diamonds, aes(cut, color)) + geom_bin2d()


## 16. 3. 7 지도

install.packages('maps')

library(maps)

data <- data.frame(murder = USArrests$Murder,
                   state = tolower(rownames(USArrests)))
map <- map_data("state")
k <- ggplot(data, aes(fill = murder))
k + geom_map(aes(map_id = state), map = map) + expand_limits(x = map$long, y = map$lat) + 
  labs(subtitle='+ geom_map(aes(map_id = state), map = map) + 
expand_limits(x = map$long, y = map$lat)')

## 16. 4 보조선
## 16. 4.2 선의 종류

lty <- c("solid", "dashed", "dotted", "dotdash", "longdash", "twodash")
linetypes <- data.frame(
  y = seq_along(lty),
  lty = lty
)


ggplot(linetypes, aes(0, y)) + 
  geom_segment(aes(xend = 5, yend = y, linetype = lty)) + 
  scale_linetype_identity() + 
  geom_text(aes(label = lty), hjust = 0, nudge_y = 0.2) +
  scale_x_continuous(NULL, breaks = NULL) + 
  scale_y_reverse(NULL, breaks = NULL)


## 16.4.3 보조선의 활용

ggplot(mpg, aes(x = cyl, y = cty)) + geom_jitter(aes(col=drv)) + 
  geom_hline(yintercept=c(10, 20, 30), linetype='dotted') + 
  labs(subtitle="+ geom_hline(yintercept=c(10, 20, 30),\n  linetype='dotted')")
ggplot(mpg, aes(x = cyl, y = cty)) + 
  geom_rect(xmin=-Inf, xmax=Inf, ymin=15, ymax=25, fill='lightgray') +
  geom_jitter(aes(col=drv)) +
  labs(subtitle="+ geom_rect(xmin=-Inf, xmax=Inf, 
  ymin=15, ymax=25, fill='lightgray')")


imax <- which.max(mpg$cty)
ax <- mpg$hwy[imax]; ay <- mpg$cty[imax]
ggplot(mpg, aes(x = hwy, y = cty)) + geom_jitter(aes(col=drv)) + 
  geom_segment(x=ax-5 , y= ay, xend=ax-0.5 , yend=ay , arrow = arrow(length = unit(5, "mm"))) +
  labs(subtitle='+ geom_segment(x=ax-5 , y=ay, xend=ax-0.5, yend=ay, 
  arrow = arrow(length = unit(5, "mm")))') #+ theme(plot.subtitle = element_text(size=11))


## 16.6 좌표계

r <- ggplot(mpg, aes(x=fl)) + geom_bar() 
r + coord_cartesian(xlim = c(-1, 5)) + labs(subtitle='+ coord_cartesian(xlim = c(-1, 5))')
r + coord_fixed(ratio = 1/10) + labs(subtitle='+ coord_fixed(ratio = 1/10)')
r + coord_flip() + labs(subtitle='+ coord_flip()')
r + coord_polar(theta = "x", direction=1 ) + labs(subtitle='+ coord_polar(theta = "x",\ndirection=1)')  
r + coord_trans(y = "sqrt") + labs(subtitle='+ coord_trans(y = "sqrt")')

## 16.5.3 좌표 레이블

r + labs(subtitle=' ')
r + labs(x='fuel type', y='frequency') + labs(subtitle="+ labs(x='fuel type', y='frequency')")

## 16.6.4 좌표 눈금과 눈금 레이블

(n <- r + geom_bar(aes(fill = fl)) + labs(subtitle=' '))
n + scale_fill_manual( 
  values = c("skyblue", "royalblue", "blue", "navy"), 
  limits = c("d", "e", "p", "r"), breaks =c("d", "e", "p", "r"), 
  name = "fuel", labels = c("D", "E", "P", "R")) + labs(subtitle='+ scale_fill_manual(values=c("skyblue","royalblue"')
n + scale_fill_discrete( 
  #palette = "Blues",
  breaks =c("d", "p"), 
  labels = c("D", "E")) +
  guides(fill='none') + labs(subtitle='+ scale_fill_discrete(breaks=c("d", "p"), labels=c("D","E"))')
t <- ggplot(mpg, aes(cty, hwy)) + geom_point() 
t + scale_x_continuous(
  breaks=seq(10,40,10), 
  labels=c('ten', 'twenty', 'thirty', 'forty')) + labs(subtitle='+ scale_x_continuous(break=seq(10,40,10))')


## 16.6.5 확대

t <- ggplot(mpg, aes(displ, hwy)) + geom_point() + geom_smooth(method='lm')
t + labs(subtitle="+ geom_point() +\ngeom_smooth(method='lm')")


t +
  coord_cartesian(xlim = c(1.5, 2), ylim = c(20, 50)) + 
  labs(subtitle='+ coord_cartesian(xlim=c(1.5,2),\nylim=c(20,50))')


t + xlim(1.5, 2) + ylim(20, 50) + 
  labs(title='+ xlim(1.5, 2) + ylim(20, 50)\n ')
t + scale_x_continuous(limits = c(1.5, 2)) + scale_y_continuous(limits = c(20, 50)) +
  labs(subtitle='+ scale_x_continuous(limits=c(1.5,2)) +
scale_y_continuous(limits=c(20,50))')

## 16.7 범례

t <- ggplot(mpg, aes(x = displ, y=cty,  color=cyl)) + geom_point() 
t + scale_x_continuous(name='city miles per gallon')+ labs(subtitle="+ scale_x_continuous(name=\n'city miles per gallon')")
t + labs(color='number of cylinders')+ labs(subtitle="+ labs(color='number of cylinders')\n ")
t + theme(legend.position='bottom') + labs(subtitle="+ theme(legend.position='bottom') ")
# top, bottom, left, right
t + guides(color='none')+ labs(subtitle="+ guides(color='none')")

t + guides(color='colorbar')+ labs(subtitle="+ guides(color='colorbar')")

t + guides(color='legend')+ labs(subtitle="+ guides(color='legend')")
t + scale_color_continuous(labels = c('two', 'three', 'four', 'five', 'six'))+ labs(subtitle="+ scale_color_continuous(labels=\nc('two', 'three', 'four', 'five', 'six'))")


## 16.8 제목과 테마

## 16.8.2 제목, 부제목, 설명문

t <- ggplot(mpg, aes(cty, hwy, color=cyl)) + geom_point()
t + labs(title='1. Fuel economy data')
t + labs(title='2. Fuel Economy Data',
         subtitle='from 1999 and 2008
for 38 popular models of car')

t + labs(title='3. Fuel Economy Data',
         subtitle='from 1999 and 2008\nfor 38 popular models of car',
         caption='Fig. x. This dataset contains a subset of
the fuel economy data that the EPA makes available
on http://fueleconomy.gov.')


## 16.8.3 테마


t <- ggplot(mpg, aes(cty, hwy, color=cyl)) + geom_point() 
t2 <- t + labs(title='3. Fuel Economy Data',
               subtitle='from 1999 and 2008
for 38 popular models of car',
               caption='Fig. x. This dataset contains a subset of
the fuel economy data that the EPA makes available
on http://fueleconomy.gov.')
t2 + theme_bw() + labs(title = '+ theme_bw()')
t2 + theme_gray() + labs(title = '+ theme_gray()')
t2 + theme_dark() + labs(title = '+ theme_dark()')
t2 + theme_classic() + labs(title = '+ theme_classic()')
t2 + theme_light() + labs(title = '+ theme_light()')
t2 + theme_linedraw() + labs(title = '+ theme_linedraw()')
t2 + theme_minimal() + labs(title = '+ theme_minimal()')
t2 + theme_void()  + labs(title = '+ theme_void()')

## 16.8.4 텍스트의 정렬, 줄간격, 서체 조정

t2 <- ggplot(mpg, aes(cty, hwy, color=cyl)) + geom_point() + 
  labs(caption='Fig. x. This dataset contains a subset of
the fuel economy data that the EPA makes available
on http://fueleconomy.gov.')
t2 + theme(plot.caption = element_text(hjust = 0))+ labs(subtitle="+ theme(plot.caption = element_text(hjust = 0))")
t2 + theme(plot.caption = element_text(hjust = 0.5))+ labs(subtitle="+ theme(plot.caption = element_text(hjust = 0.5))")
t2 + theme(plot.caption = element_text(hjust = 1)) + labs(subtitle = "theme(plot.caption = element_text(hjust = 1))")
t2 + theme(plot.caption = element_text(angle = 0))+ labs(subtitle="+ theme(plot.caption = element_text(angle = 0))")
t2 + theme(plot.caption = element_text(angle = 10))+ labs(subtitle="+ theme(plot.caption = element_text(angle = 10))")
t2 + theme(plot.caption = element_text(lineheight=.8, face='bold'))+ labs(subtitle="+ theme(plot.caption = element_text(lineheight=.8, face='bold'))")
t2 + theme(axis.text.x = element_text(angle = 45))+ labs(subtitle="+ theme(axis.text.x = element_text(angle = 45))")
t2 + theme(axis.text.x = element_text(angle = 90))+ labs(subtitle="+ theme(axis.text.x = element_text(angle = 90))")

## 16.9 결과 정리 및 저장

## 16.9.1 여러 그래프를 하나의 그래프에 배열

p1 <- ggplot(mtcars, aes(x=mpg, y=wt, col=factor(vs))) + geom_point()
p2 <- ggplot(mtcars, aes(x=factor(vs), fill=factor(am))) + geom_bar()
p3 <- ggplot(mtcars, aes(x=wt, y=qsec, col=factor(gear))) + geom_line()
p4 <- ggplot(mtcars, aes(x=disp, y=drat)) + geom_point(col='red') + theme_minimal()
gridExtra::grid.arrange(p1, p2, p3, p4, ncol=2)


cowplot::plot_grid(p1, p2, labels = c("A", "B"), align = "h")


## 16.9.2 시각화 결과 저장

p <-
  mtcars %>% 
  transmute(cyl=factor(cyl), gear=factor(gear)) %>%
  ggplot(aes(x=cyl, fill=gear)) + geom_bar()

mtcars %>% 
  transmute(cyl=factor(cyl), hp=hp, am = factor(am)) %>%
  ggplot(aes(x=cyl, y = hp, fill=am)) + geom_boxplot()

ggsave(filename = 'picRecent.png') 
ggsave(filename = 'picp.jpg', plot=p)


