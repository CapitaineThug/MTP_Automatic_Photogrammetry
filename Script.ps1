function GenerateForm {
    ########################################################################
    # Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
    # Generated On: 07.10.2023 14:35
    # Generated By: Nicolas
    ########################################################################


    #Fonction pour synchroniser les images depuis la caméra en MTP
    function SyncFiles {

        #Variables
        $ConfigSync = ".\FileSync_Scripts\CameraFileSync.ffs_batch"
        $CameraPath = $TB_ImagesPath.Text
        $AllProjectRoot = $TB_ProjectPath.Text
        $ProjectName = $TB_ProjectName.Text
        $ProjectPath = $TB_ProjectPath.Text + "\" + $ProjectName
        $ProjectImagesPath = $ProjectPath + "\IMG"

        #Création des répertoires s'ils n'existent pas déjà
        if (test-Path -Path $ProjectPath) {
            
        }
        else {
            New-Item -Path $AllProjectRoot -Name $ProjectName -ItemType "directory" #Project Directory
        }
        if (test-Path -Path $ProjectImagesPath) {
            
        }
        else {
            New-Item -Path $ProjectPath -Name "IMG" -ItemType "directory" #Images Directory
        }


        #Modification du fichier de configuration ffs_gui
        $ConfigXml = [xml](Get-Content -Path $ConfigSync)
        $PairElement = $ConfigXml.FreeFileSync.FolderPairs.Pair
        $PairElement.Left = $CameraPath
        $PairElement.Right = $ProjectImagesPath
        $ConfigXml.Save($ConfigSync)


        #Synchronisation des fichiers avec le répertoire actuel
        $OldFiles = Get-ChildItem -Path $ProjectImagesPath
        StatusOn
        Start-Process -FilePath '"FileSync_Scripts\CameraFileSync.ffs_batch"'

        #Délai demandé
        $TimeToWait = [int]::Parse($TB_WaitTime.text)
        Start-Sleep -Seconds $TimeToWait

        #Vérification s'il y a eu des changements
        if ($OldFiles.count -eq (Get-ChildItem -Path $ProjectImagesPath).count) {
            #Aucune modif, lancer le process
            StatusOff
            LaunchProcess

        }
        else {
            #Modif détectée, continuer à sync
            SyncFiles

        }

    }

    #Fonction pour lancer le calcul dans metashape
    function LaunchProcess {

        #Lancement du script python pour Metashape
        Start-Process -FilePath "Metashape.exe" -ArgumentList "-r", '"Metashape_Scripts\CreateProjectFiles.py"', $ProjectImagesPath, $ProjectPath, $TB_ProjectName.text -Wait

        #Ouverture du projet
        $FullProjectPath = $ProjectPath + "\" + $TB_ProjectName.text + ".psx"
        write-host $FullProjectPath
        Start-Process -FilePath $FullProjectPath

    }

    function StatusOff {

        $label9.BackColor = "Tomato"
        $label9.Text = "Idle"

    }

    function StatusOn {

        $label9.BackColor = "Green"
        $label9.Text = "Syncing"

    }
    
    #region Import the Assemblies
    [reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
    #endregion
        
    #region Generated Form Objects
    $F_Main = New-Object System.Windows.Forms.Form
    $GB_Scan = New-Object System.Windows.Forms.GroupBox
    $GB_Lancement = New-Object System.Windows.Forms.GroupBox
    $L_06 = New-Object System.Windows.Forms.Label
    $button2 = New-Object System.Windows.Forms.Button
    $GB_Sync = New-Object System.Windows.Forms.GroupBox
    $label9 = New-Object System.Windows.Forms.Label
    $L_07 = New-Object System.Windows.Forms.Label
    $L_05 = New-Object System.Windows.Forms.Label
    $BT_LaunchSync = New-Object System.Windows.Forms.Button
    $GB_FileCopy = New-Object System.Windows.Forms.GroupBox
    $TB_WaitTime = New-Object System.Windows.Forms.TextBox
    $RTB_CopyDetails = New-Object System.Windows.Forms.RichTextBox
    $L_04 = New-Object System.Windows.Forms.Label
    $GB_Files = New-Object System.Windows.Forms.GroupBox
    $TB_ProjectName = New-Object System.Windows.Forms.TextBox
    $L_03 = New-Object System.Windows.Forms.Label
    $TB_ProjectPath = New-Object System.Windows.Forms.TextBox
    $L_02 = New-Object System.Windows.Forms.Label
    $TB_ImagesPath = New-Object System.Windows.Forms.TextBox
    $L_01 = New-Object System.Windows.Forms.Label
    $L_Title = New-Object System.Windows.Forms.Label
    $saveFileDialog1 = New-Object System.Windows.Forms.SaveFileDialog
    $InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
    #endregion Generated Form Objects
        
    #----------------------------------------------
    #Generated Event Script Blocks
    #----------------------------------------------
    #Provide Custom Code for events specified in PrimalForms.
    $handler_L_ImagePath_Click = 
    {
        #TODO: Place custom script here
        
    }
        
    $BT_LaunchSync_OnClick = 
    {
        #Lancer la synchronisation
        SyncFiles
        
    }
        
    $handler_L_ProjectPath_Click = 
    {
        #TODO: Place custom script here
        
    }
        
    $handler_TB_ImagesPath_TextChanged = 
    {
        #TODO: Place custom script here
        
    }
        
    $handler_GB_Files_Enter = 
    {
        #TODO: Place custom script here
        
    }
        
    $button2_OnClick = 
    {
        LaunchProcess
        
    }
        
    $handler_label1_Click = 
    {
        #TODO: Place custom script here
        
    }
        
    $handler_tTB_Project_TextChanged = 
    {
        #TODO: Place custom script here
        
    }
        
    $OnLoadForm_StateCorrection =
    { #Correct the initial state of the form to prevent the .Net maximized form issue
        $F_Main.WindowState = $InitialFormWindowState
    }
        
    #----------------------------------------------
    #region Generated Form Code
    $F_Main.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 255, 255)
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 505
    $System_Drawing_Size.Width = 976
    $F_Main.ClientSize = $System_Drawing_Size
    $F_Main.DataBindings.DefaultDataSourceUpdateMode = 0
    $F_Main.Font = New-Object System.Drawing.Font("Cascadia Mono", 8.25, 0, 3, 1)
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 544
    $System_Drawing_Size.Width = 992
    $F_Main.MinimumSize = $System_Drawing_Size
    $F_Main.Name = "F_Main"
    $F_Main.Text = "MTP Automatic Photogrammetry"
        
    $GB_Scan.Anchor = 14
        
    $GB_Scan.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 341
    $GB_Scan.Location = $System_Drawing_Point
    $GB_Scan.Name = "GB_Scan"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 149
    $System_Drawing_Size.Width = 952
    $GB_Scan.Size = $System_Drawing_Size
    $GB_Scan.TabIndex = 3
    $GB_Scan.TabStop = $False
    $GB_Scan.Text = "Scan"
        
    $F_Main.Controls.Add($GB_Scan)
    $GB_Lancement.Anchor = 9
        
    $GB_Lancement.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 574
    $System_Drawing_Point.Y = 31
    $GB_Lancement.Location = $System_Drawing_Point
    $GB_Lancement.Name = "GB_Lancement"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 104
    $System_Drawing_Size.Width = 357
    $GB_Lancement.Size = $System_Drawing_Size
    $GB_Lancement.TabIndex = 5
    $GB_Lancement.TabStop = $False
    $GB_Lancement.Text = "Lancement"
        
    $GB_Scan.Controls.Add($GB_Lancement)
    $L_06.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 6
    $System_Drawing_Point.Y = 28
    $L_06.Location = $System_Drawing_Point
    $L_06.Name = "L_06"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 18
    $System_Drawing_Size.Width = 342
    $L_06.Size = $System_Drawing_Size
    $L_06.TabIndex = 2
    $L_06.Text = "Lancer le scan 3D maintenant"
        
    $GB_Lancement.Controls.Add($L_06)
        
    $button2.BackColor = [System.Drawing.Color]::FromArgb(255, 0, 250, 154)
        
    $button2.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 6
    $System_Drawing_Point.Y = 49
    $button2.Location = $System_Drawing_Point
    $button2.Name = "button2"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 37
    $System_Drawing_Size.Width = 342
    $button2.Size = $System_Drawing_Size
    $button2.TabIndex = 3
    $button2.Text = "Lancer le scan"
    $button2.UseVisualStyleBackColor = $False
    $button2.add_Click($button2_OnClick)
        
    $GB_Lancement.Controls.Add($button2)
        
        
        
    $GB_Sync.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 22
    $System_Drawing_Point.Y = 31
    $GB_Sync.Location = $System_Drawing_Point
    $GB_Sync.Name = "GB_Sync"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 104
    $System_Drawing_Size.Width = 546
    $GB_Sync.Size = $System_Drawing_Size
    $GB_Sync.TabIndex = 4
    $GB_Sync.TabStop = $False
    $GB_Sync.Text = "Synchronisation"
        
    $GB_Scan.Controls.Add($GB_Sync)
    $label9.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 99, 71)
    $label9.DataBindings.DefaultDataSourceUpdateMode = 0
    $label9.Font = New-Object System.Drawing.Font("Courier New", 14.25, 1, 3, 1)
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 364
    $System_Drawing_Point.Y = 54
    $label9.Location = $System_Drawing_Point
    $label9.Name = "label9"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 37
    $System_Drawing_Size.Width = 168
    $label9.Size = $System_Drawing_Size
    $label9.TabIndex = 3
    $label9.Text = "Idle"
    $label9.TextAlign = 32
        
    $GB_Sync.Controls.Add($label9)
        
    $L_07.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 364
    $System_Drawing_Point.Y = 28
    $L_07.Location = $System_Drawing_Point
    $L_07.Name = "L_07"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 16
    $System_Drawing_Size.Width = 164
    $L_07.Size = $System_Drawing_Size
    $L_07.TabIndex = 2
    $L_07.Text = "Status"
        
    $GB_Sync.Controls.Add($L_07)
        
    $L_05.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 6
    $System_Drawing_Point.Y = 28
    $L_05.Location = $System_Drawing_Point
    $L_05.Name = "L_05"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 353
    $L_05.Size = $System_Drawing_Size
    $L_05.TabIndex = 0
    $L_05.Text = "Lancer la sychronisation automatique des images"
        
    $GB_Sync.Controls.Add($L_05)
        
    $BT_LaunchSync.BackColor = [System.Drawing.Color]::FromArgb(255, 0, 191, 255)
        
    $BT_LaunchSync.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 6
    $System_Drawing_Point.Y = 54
    $BT_LaunchSync.Location = $System_Drawing_Point
    $BT_LaunchSync.Name = "BT_LaunchSync"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 37
    $System_Drawing_Size.Width = 341
    $BT_LaunchSync.Size = $System_Drawing_Size
    $BT_LaunchSync.TabIndex = 1
    $BT_LaunchSync.Text = "Synchroniser automatiquement"
    $BT_LaunchSync.UseVisualStyleBackColor = $False
    $BT_LaunchSync.add_Click($BT_LaunchSync_OnClick)
        
    $GB_Sync.Controls.Add($BT_LaunchSync)
        
        
        
    $GB_FileCopy.Anchor = 15
        
    $GB_FileCopy.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 221
    $GB_FileCopy.Location = $System_Drawing_Point
    $GB_FileCopy.Name = "GB_FileCopy"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 109
    $System_Drawing_Size.Width = 952
    $GB_FileCopy.Size = $System_Drawing_Size
    $GB_FileCopy.TabIndex = 2
    $GB_FileCopy.TabStop = $False
    $GB_FileCopy.Text = "Copie des fichiers"
        
    $F_Main.Controls.Add($GB_FileCopy)
    $TB_WaitTime.DataBindings.DefaultDataSourceUpdateMode = 0
    $TB_WaitTime.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 128, 0)
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 264
    $System_Drawing_Point.Y = 26
    $TB_WaitTime.Location = $System_Drawing_Point
    $TB_WaitTime.Name = "TB_WaitTime"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 83
    $TB_WaitTime.Size = $System_Drawing_Size
    $TB_WaitTime.TabIndex = 2
    $TB_WaitTime.Text = "10"
        
    $GB_FileCopy.Controls.Add($TB_WaitTime)
        
    $RTB_CopyDetails.Anchor = 15
    $RTB_CopyDetails.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 21
    $System_Drawing_Point.Y = 55
    $RTB_CopyDetails.Location = $System_Drawing_Point
    $RTB_CopyDetails.Name = "RTB_CopyDetails"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 41
    $System_Drawing_Size.Width = 910
    $RTB_CopyDetails.Size = $System_Drawing_Size
    $RTB_CopyDetails.TabIndex = 1
    $RTB_CopyDetails.Text = "Le programme va attendre un délai définit après chaque nouvelle photographie prise. Si aucune nouvelle photographie n''est faite durant ce délai, le scan 3D peut démarrer. C''est utilisé pour la synchronisation automatique des images depuis la caméra en MTP."
        
    $GB_FileCopy.Controls.Add($RTB_CopyDetails)
        
    $L_04.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 21
    $System_Drawing_Point.Y = 29
    $L_04.Location = $System_Drawing_Point
    $L_04.Name = "L_04"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 237
    $L_04.Size = $System_Drawing_Size
    $L_04.TabIndex = 0
    $L_04.Text = "Délai (sec) avant de commencer le scan"
        
    $GB_FileCopy.Controls.Add($L_04)
        
        
    $GB_Files.Anchor = 13
        
    $GB_Files.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 13
    $System_Drawing_Point.Y = 66
    $GB_Files.Location = $System_Drawing_Point
    $GB_Files.Name = "GB_Files"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 148
    $System_Drawing_Size.Width = 951
    $GB_Files.Size = $System_Drawing_Size
    $GB_Files.TabIndex = 1
    $GB_Files.TabStop = $False
    $GB_Files.Text = "Fichiers"
    $GB_Files.add_Enter($handler_GB_Files_Enter)
        
    $F_Main.Controls.Add($GB_Files)
    $TB_ProjectName.DataBindings.DefaultDataSourceUpdateMode = 0
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 207
    $System_Drawing_Point.Y = 112
    $TB_ProjectName.Location = $System_Drawing_Point
    $TB_ProjectName.Name = "TB_ProjectName"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 155
    $TB_ProjectName.Size = $System_Drawing_Size
    $TB_ProjectName.TabIndex = 5
    $TB_ProjectName.Text = "3D_Scan"
        
    $GB_Files.Controls.Add($TB_ProjectName)
        
    $L_03.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 21
    $System_Drawing_Point.Y = 112
    $L_03.Location = $System_Drawing_Point
    $L_03.Name = "L_03"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 23
    $System_Drawing_Size.Width = 158
    $L_03.Size = $System_Drawing_Size
    $L_03.TabIndex = 4
    $L_03.Text = "Nom du projet"
        
    $GB_Files.Controls.Add($L_03)
        
    $TB_ProjectPath.Anchor = 13
    $TB_ProjectPath.DataBindings.DefaultDataSourceUpdateMode = 0
    $TB_ProjectPath.ForeColor = [System.Drawing.Color]::FromArgb(255, 255, 0, 0)
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 207
    $System_Drawing_Point.Y = 74
    $TB_ProjectPath.Location = $System_Drawing_Point
    $TB_ProjectPath.Name = "TB_ProjectPath"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 676
    $TB_ProjectPath.Size = $System_Drawing_Size
    $TB_ProjectPath.TabIndex = 3
    $TB_ProjectPath.Text = "C:\"
    $TB_ProjectPath.add_TextChanged($handler_tTB_Project_TextChanged)
        
    $GB_Files.Controls.Add($TB_ProjectPath)
        
    $L_02.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 21
    $System_Drawing_Point.Y = 74
    $L_02.Location = $System_Drawing_Point
    $L_02.Name = "L_02"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 21
    $System_Drawing_Size.Width = 180
    $L_02.Size = $System_Drawing_Size
    $L_02.TabIndex = 2
    $L_02.Text = "Path de sauvegarde du projet"
    $L_02.add_Click($handler_L_ProjectPath_Click)
        
    $GB_Files.Controls.Add($L_02)
        
    $TB_ImagesPath.Anchor = 13
    $TB_ImagesPath.DataBindings.DefaultDataSourceUpdateMode = 0
    $TB_ImagesPath.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 0, 255)
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 207
    $System_Drawing_Point.Y = 35
    $TB_ImagesPath.Location = $System_Drawing_Point
    $TB_ImagesPath.Name = "TB_ImagesPath"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 20
    $System_Drawing_Size.Width = 676
    $TB_ImagesPath.Size = $System_Drawing_Size
    $TB_ImagesPath.TabIndex = 1
    $TB_ImagesPath.Text = "mtp:\"
    $TB_ImagesPath.add_TextChanged($handler_TB_ImagesPath_TextChanged)
        
    $GB_Files.Controls.Add($TB_ImagesPath)
        
    $L_01.DataBindings.DefaultDataSourceUpdateMode = 0
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 21
    $System_Drawing_Point.Y = 35
    $L_01.Location = $System_Drawing_Point
    $L_01.Name = "L_01"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 21
    $System_Drawing_Size.Width = 158
    $L_01.Size = $System_Drawing_Size
    $L_01.TabIndex = 0
    $L_01.Text = "Path des images"
    $L_01.add_Click($handler_L_ImagePath_Click)
        
    $GB_Files.Controls.Add($L_01)
        
        
    $L_Title.Anchor = 13
    $L_Title.BackColor = [System.Drawing.Color]::FromArgb(0, 255, 255, 255)
    $L_Title.DataBindings.DefaultDataSourceUpdateMode = 0
    $L_Title.Font = New-Object System.Drawing.Font("Source Code Pro Black", 26.2499981, 1, 3, 1)
    $L_Title.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 0, 0)
        
    $System_Drawing_Point = New-Object System.Drawing.Point
    $System_Drawing_Point.X = 12
    $System_Drawing_Point.Y = 9
    $L_Title.Location = $System_Drawing_Point
    $L_Title.Name = "L_Title"
    $System_Drawing_Size = New-Object System.Drawing.Size
    $System_Drawing_Size.Height = 54
    $System_Drawing_Size.Width = 952
    $L_Title.Size = $System_Drawing_Size
    $L_Title.TabIndex = 0
    $L_Title.Text = "MTP Automatic Photogrammetry"
    $L_Title.TextAlign = 2
    $L_Title.add_Click($handler_label1_Click)
        
    $F_Main.Controls.Add($L_Title)
        
    $saveFileDialog1.CreatePrompt = $True
    $saveFileDialog1.InitialDirectory = "C:\"
    $saveFileDialog1.ShowHelp = $True
        
    #endregion Generated Form Code
        
    #Save the initial state of the form
    $InitialFormWindowState = $F_Main.WindowState
    #Init the OnLoad event to correct the initial state of the form
    $F_Main.add_Load($OnLoadForm_StateCorrection)
    #Show the Form
    $F_Main.ShowDialog() | Out-Null
        
} #End Function
        
#Call the Function
GenerateForm
        