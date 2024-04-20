---
title: "קיצד ניתן לעזור?"
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
    ניתן לעשות זאת מהשורת פקודות על ידי  שימוש ב[git](https://git-scm.com/downloads):
![image](https://docs.github.com/assets/cb-69468/mw-1440/images/help/repository/https-url-clone-cli.webp)

<div style="direction: ltr !important;">

```sh
git clone https://github.com/<UserName>/bring-them-home.co.il.git
```

</div>

3. הרצה של התסריט להפעלת hugo:

### ווינדוס

<div style="direction: ltr !important;">

```ps
./install-hugo.ps1  
```

</div>

### לינוקס

<div style="direction: ltr !important;">

```sh
sudo ./install-hugo.sh && exit 0
```

</div>

4. הפעלת מצב בנייה של hugo משורת הפקודות:

<div style="direction: ltr !important;">

```sh
# In the sme directory as the git clone
hugo server
```

</div>

אתם צריכים לראות משהו בסגנון של:

<div style="direction: ltr !important;">

```sh
Start building sites … 
hugo v0.92.2+extended linux/amd64 BuildDate=2023-01-31T11:11:57Z VendorInfo=ubuntu:0.92.2-1ubuntu0.1

                   | HE  
-------------------+-----
  Pages            | 20  
  Paginator pages  |  1  
  Non-page files   |  0  
  Static files     | 19  
  Processed images |  6  
  Aliases          |  7  
  Sitemaps         |  1  
  Cleaned          |  0  

Built in 2475 ms
Watching for changes in /home/noam/Music/bring-them-home.co.il/{archetypes,assets,content,i18n,layouts,package.json,postcss.config.js,static,tailwind.config.js}
Watching for config changes in /home/noam/Music/bring-them-home.co.il/config.yaml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

</div>

אחרי הפעלת מצב בנייה, ניתן לראות את האתר מהמחשב שלכם על ידי כניסה אל [localhost:1313](http://localhost:1313)

5. הוספת פוסט:
בשורת הפקודות בתיקייה שבו נמצא ה- git clone הריצו את הפקודה הבאה:

<div style="direction: ltr !important;">

```sh
hugo new missing/<name>-<lastname>.md
```

</div>

אתם אמורים לקבל את הודעה דומה לזו:

<div style="direction: ltr !important;">

```sh
Content "/home/noam/Music/bring-them-home.co.il/content/missing/name-lastname.md" created
```

</div>

הכנסו לקובץ והחלו לערוך:

### ווינדוס

<div style="direction: ltr !important;">

```ps
notepade.exe .\content\missing\<name>-<lastname>.md
```

</div>

### לינוקס

<div style="direction: ltr !important;">

```sh
vi /content/missing/<name>-<lastname>.md
```

</div>

אתם אמורים לקבל עמוד דומה לזה:

![image](/images/edit-missing-md.png)

אנא שנו את הפרטים הבאים:

- כותרת אל השם המלא בעברית (title:)
- שם של תמונה אל תמונה של החטוף (assets/images/missing/CHANGE-ME)
- משפט קצר על החטוף (summary: שנה אתי)
- נכתב על ידי (author: שנה אותי)

### תמונה של החטוף יש לשמור **אך ורק** בנתיב /assets/images/missing.

<br>

6. לאחר שמירה של הפוסט או השינויים דחפו את השינויים ל fork שיצרתם:

### ווינדוס

<div style="direction: ltr !important;">

```ps
git config --global user.email "your@example.com"
git config --global user.name "UserName"
git add .
git commit -m "Added a post"
git push --force origin main
```

</div>

### לינוקס

<div style="direction: ltr !important;">

```sh
git config --global user.email "your@example.com"
git config --global user.name "UserName"
git add . && git commit -m "Added a post" && git push --force origin main
```

</div>

<br >

7. שלחו Pull Request עם ה fork שיצרתם:

באתר של GitHub לכו אל ה fork שיצרתם ולחצו על Compare & pull request:
![image](https://docs.github.com/assets/cb-34106/mw-1440/images/help/pull_requests/pull-request-compare-pull-request.webp)

מלאו את הפרטים:

![image](https://opensource.com/sites/default/files/uploads/open-a-pull-request_crop.png)

ושלחו!

---

לכל פנייה לעזרה ניתן לפנות אלינו ב[טופס יצירת הקשר](/contact/) או לחלופין שימוש ב [GitHub Discussions](https://github.com/Noam-Alum/bring-them-home.co.il/discussions/categories/%D7%A2%D7%96%D7%A8%D7%94).