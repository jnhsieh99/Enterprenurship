# Windows PowerShell 版
# 需求：已安裝 Git (git --version 可用)

# 1) Clone repo
git clone https://github.com/jnhsieh99/Enterprenurship.git
Set-Location Enterprenurship

# 2) 更新 index.html：若尚未有 Other Courses 連結就插入到 <div class="meta-row"> 後面
$indexPath = "index.html"
$indexContent = Get-Content $indexPath -Raw -Encoding UTF8

if ($indexContent -notmatch 'href="Other Courses.html"') {
  $indexContent = $indexContent -replace '<div class="meta-row">', "<div class=`"meta-row`">`r`n        <a class=`"pill`" href=`"Other Courses.html`">OTHER COURSES</a>"
  Set-Content -Path $indexPath -Value $indexContent -Encoding UTF8
  Write-Host "index.html 已加入 OTHER COURSES 連結"
} else {
  Write-Host "index.html 已存在 OTHER COURSES 連結，略過"
}

# 3) 新增/覆蓋 Other Courses.html（6 項最新版）
$otherCourses = @'
<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Other Courses</title>
  <style>
    :root{
      --ink:#12262a;
      --teal:#1f3a3d;
      --paper:#f7f2e7;
      --surface:#ffffff;
      --line: rgba(18,38,42,0.14);
      --rust:#b5533c;
      --radius:14px;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      font-family:-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Noto Sans TC","PingFang TC","Heiti TC",sans-serif;
      background:var(--paper);
      color:var(--ink);
      line-height:1.7;
    }
    .wrap{max-width:980px;margin:0 auto;padding:40px 20px 64px}
    h1{margin:0 0 18px;font-size:clamp(1.8rem,4vw,2.6rem);color:var(--teal);}
    .sub{margin:0 0 28px;color:#4b5f5c}
    .list{
      display:grid;
      grid-template-columns:repeat(auto-fit,minmax(240px,1fr));
      gap:14px;
      padding:0;
      list-style:none;
      margin:0;
    }
    .card{
      background:var(--surface);
      border:1px solid var(--line);
      border-radius:var(--radius);
      padding:18px 16px;
      box-shadow:0 1px 2px rgba(0,0,0,.04),0 8px 20px rgba(0,0,0,.05);
    }
    .card h2{margin:0;font-size:1.05rem;color:var(--rust);}
    .top-link{
      display:inline-block;
      margin-bottom:20px;
      color:var(--rust);
      text-decoration:none;
      font-weight:600;
    }
    .top-link:hover{text-decoration:underline}
  </style>
</head>
<body>
  <div class="wrap">
    <a class="top-link" href="index.html">← Back to Home</a>
    <h1>Other Courses</h1>
    <p class="sub">課程與教材導覽</p>

    <ul class="list">
      <li class="card"><h2>1. Management syllabus map</h2></li>
      <li class="card"><h2>2. Marketing syllabus map</h2></li>
      <li class="card"><h2>3. Travel management map</h2></li>
      <li class="card"><h2>4. Media pr_practice map</h2></li>
      <li class="card"><h2>5. Mice advanced management map</h2></li>
      <li class="card"><h2>6. Economics syllabus map</h2></li>
    </ul>
  </div>
</body>
</html>
'@

Set-Content -Path "Other Courses.html" -Value $otherCourses -Encoding UTF8
Write-Host "Other Courses.html 已建立/更新"

# 4) Commit & Push
git add index.html "Other Courses.html"
git commit -m "Add Other Courses page and homepage link"
git push origin main