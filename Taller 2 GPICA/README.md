# Taller 2 GPICA

## Requisitos previos

Para ejecutar este proyecto correctamente, debe cumplir con los siguientes requisitos:

### 1. Instalar R en el sistema

Descargue e instale R desde [https://cran.r-project.org/](https://cran.r-project.org/). Siga las instrucciones de instalación según su sistema operativo (Windows, macOS o Linux).

### 2. Verificar RStudio en las variables de entorno

Asegúrese de que RStudio esté correctamente configurado en las variables de entorno del sistema. Para verificar esto:

- En **Windows**: 
  1. Abra las "Variables de entorno" (Busque "variables" en el menú Inicio)
  2. Verifique que la ruta de instalación de RStudio esté incluida en la variable `PATH`
  3. Si no está, agregue la ruta típicamente ubicada en `C:\Program Files\RStudio\bin`

### 3. Instalar renv

Una vez instalados R y RStudio, instale el gestor de dependencias `renv`. En R o RStudio, ejecute:

```r
install.packages("renv")
```

Deseche (en papelera) esa terminal de R

## Ejecución del proyecto

### Abrir la carpeta del proyecto en VS Code

Antes de ejecutar el script, abra la carpeta del proyecto en Visual Studio Code:

1. Abra Visual Studio Code
2. Vaya a **Archivo** → **Abrir carpeta**
3. Navegue hasta la carpeta del proyecto `Taller 2 GPICA` y selecciónela
4. Haga clic en **Seleccionar carpeta**

Una vez completados todos los requisitos, puede ejecutar el script principal:

```powershell
.\runall.ps1
```

Este script ejecutará secuencialmente todos los análisis y generará los resultados en la carpeta `resultados/`.

---

# Workshop 2 GPICA (English)

## Prerequisites

To run this project correctly, you must meet the following requirements:

### 1. Install R on the system

Download and install R from [https://cran.r-project.org/](https://cran.r-project.org/). Follow the installation instructions according to your operating system (Windows, macOS, or Linux).

### 2. Verify RStudio in environment variables

Make sure RStudio is properly configured in your system's environment variables. To verify this:

- On **Windows**: 
  1. Open "Environment Variables" (Search for "variables" in the Start menu)
  2. Verify that the RStudio installation path is included in the `PATH` variable
  3. If not, add the path typically located at `C:\Program Files\RStudio\bin`

### 3. Install renv

Once R and RStudio are installed, install the `renv` dependency manager. In R or RStudio, execute:

```r
install.packages("renv")
```

Then, in the project folder, run the renv initialization script:

```r
source("codigo/0_renv_initialize.R")
```

This will restore all project dependencies specified in `renv.lock`.

## Running the project

### Open the project folder in VS Code

Before running the script, open the project folder in Visual Studio Code:

1. Open Visual Studio Code
2. Go to **File** → **Open Folder**
3. Navigate to the project folder `Taller 2 GPICA` and select it
4. Click **Select Folder**

Once all requirements are met, you can run the main script:

```powershell
.\runall.ps1
```

This script will sequentially execute all analyses and generate results in the `resultados/` folder.

---

# Workshop 2 GPICA (Deutsch)

## Voraussetzungen

Um dieses Projekt korrekt auszuführen, müssen Sie die folgenden Anforderungen erfüllen:

### 1. R auf dem System installieren

Laden Sie R von [https://cran.r-project.org/](https://cran.r-project.org/) herunter und installieren Sie es. Befolgen Sie die Installationsanweisungen für Ihr Betriebssystem (Windows, macOS oder Linux).

### 2. RStudio in Umgebungsvariablen überprüfen

Stellen Sie sicher, dass RStudio in den Umgebungsvariablen Ihres Systems korrekt konfiguriert ist. Zum Überprüfen:

- Auf **Windows**: 
  1. Öffnen Sie "Umgebungsvariablen" (Suchen Sie im Startmenü nach "Umgebung")
  2. Überprüfen Sie, ob der RStudio-Installationspfad in der Variable `PATH` enthalten ist
  3. Falls nicht, fügen Sie den üblicherweise unter `C:\Program Files\RStudio\bin` befindlichen Pfad hinzu

### 3. renv installieren

Nachdem R und RStudio installiert sind, installieren Sie den Abhängigkeits-Manager `renv`. In R oder RStudio führen Sie aus:

```r
install.packages("renv")
```

Führen Sie dann im Projektordner das renv-Initialisierungsskript aus:

```r
source("codigo/0_renv_initialize.R")
```

Dies stellt alle in `renv.lock` angegebenen Projektabhängigkeiten wieder her.

## Ausführung des Projekts

Nachdem alle Anforderungen erfüllt sind, können Sie das Hauptskript ausführen:

```powershell
.\runall.ps1
```

Dieses Skript führt alle Analysen nacheinander aus und generiert Ergebnisse im Ordner `resultados/`.

---

# Семинар 2 GPICA (Русский)

## Предварительные требования

Для правильного запуска этого проекта необходимо выполнить следующие требования:

### 1. Установить R в системе

Загрузите и установите R с [https://cran.r-project.org/](https://cran.r-project.org/). Следуйте инструкциям по установке для вашей операционной системы (Windows, macOS или Linux).

### 2. Проверить RStudio в переменных окружения

Убедитесь, что RStudio правильно настроен в переменных окружения вашей системы. Для проверки:

- На **Windows**: 
  1. Откройте "Переменные окружения" (Поищите "переменные" в меню "Пуск")
  2. Проверьте, что путь установки RStudio включен в переменную `PATH`
  3. Если нет, добавьте путь, обычно расположенный в `C:\Program Files\RStudio\bin`

### 3. Установить renv

После установки R и RStudio установите менеджер зависимостей `renv`. В R или RStudio выполните:

```r
install.packages("renv")
```

Затем в папке проекта запустите скрипт инициализации renv:

```r
source("codigo/0_renv_initialize.R")
```

Это восстановит все зависимости проекта, указанные в `renv.lock`.

## Запуск проекта

Как только все требования выполнены, вы можете запустить основной скрипт:

```powershell
.\runall.ps1
```

Этот скрипт последовательно выполнит все анализы и создаст результаты в папке `resultados/`.

---

# 研讨会 2 GPICA (中文)

## 前置要求

要正确运行此项目，您必须满足以下要求：

### 1. 在系统上安装 R

从 [https://cran.r-project.org/](https://cran.r-project.org/) 下载并安装 R。根据您的操作系统（Windows、macOS 或 Linux）按照安装说明进行操作。

### 2. 验证环境变量中的 RStudio

确保 RStudio 在系统环境变量中配置正确。要进行验证：

- 在 **Windows** 上：
  1. 打开"环境变量"（在开始菜单中搜索"环境变量"）
  2. 验证 RStudio 安装路径是否包含在 `PATH` 变量中
  3. 如果没有，请添加通常位于 `C:\Program Files\RStudio\bin` 的路径

### 3. 安装 renv

安装 R 和 RStudio 后，安装依赖管理器 `renv`。在 R 或 RStudio 中执行：

```r
install.packages("renv")
```

然后，在项目文件夹中运行 renv 初始化脚本：

```r
source("codigo/0_renv_initialize.R")
```

这将恢复 `renv.lock` 中指定的所有项目依赖项。

## 运行项目

满足所有要求后，您可以运行主脚本：

```powershell
.\runall.ps1
```

此脚本将按顺序执行所有分析，并在 `resultados/` 文件夹中生成结果。
