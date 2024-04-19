---
title: "קיצד ניתן לעזור"
date: 2024-04-19T23:20:08+03:00
draft: false
language: he
summary: קיצד ניתן לעזור
author: נועם אלום
tags: כללי
---

# דרכים בהן ניתן לעזור:

- שייתוף סיפורים של חטופים עימנו בעזרת [טופס יצירת הקשר](/contact/).
- קישור שלנו עם משפחו החטופים למען קבלת אישור לפרסום הסיפור שלהם.
- הוספת הפוסט על החטופים אשר יש בידינו את הסיפור שלהם ויש אישור לפרסום הסיפור בעזרת תמיכה ב- [GitHub](https://github.com/Noam-Alum/bring-them-home.co.il).
- הצעת רעיונות לשיפור או ב[טופס יצירת הקשר](/contact/) או על ידי יצירת [issue ב GitHub](https://github.com/Noam-Alum/bring-them-home.co.il/issues
).

---

## לא בטוח איך ניתן להוסיף פוסט דרך GitHub?
דבר ראשון, אם אינך מוכר/ת  עם GitHub אולי עדיף שתשתפו אותנו בפוסט שאתם רוצים להוסיף בעזרת [טופס יצירת הקשר](/contact/).

**במידה ואת/ה כן מכירים את GitHub להלן השלבים להוספת פוסט:**
1. יצירת fork ל- repository:
![image](https://docs.github.com/assets/cb-40742/mw-1440/images/help/repository/fork-button.webp)

2. שכפול ה fork שיצרתם/ן אל המחשב האישי שלכן/ם:
    ניתן לעשות זאת מהשורת פקודות על ידי שימוש ב`git`:
![image](https://docs.github.com/assets/cb-69468/mw-1440/images/help/repository/https-url-clone-cli.webp)

<div style="direction: ltr !important;">

```sh
git clone git@github.com:<UserName>/bring-them-home.co.il.git
```

</div>

או

<div style="direction: ltr !important;">

```sh
git clone https://github.com/<UserName>/bring-them-home.co.il.git
```

</div>

3. הרצה של התסריט להפעלת hugo:

### ווינדוס

<div style="direction: ltr !important;">

```ps
./install-hugo.ps   
```

</div>

### לינוקס

<div style="direction: ltr !important;">

```sh
./install-hugo.sh
```

</div>