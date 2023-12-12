-- скрипт подгрузки фиксов для режима выживший

Re_LoadFixes()
    setText=GetData("Renew.SurvTitle")
    SetData("Renew.BriefTitle", setText)

    setText=GetData("Renew.SurvTXT")
    SetData("Renew.BriefText", setText)

    setText=GetData("Renew.SurvObj1")
    SetData("Renew.BriefObj1", setText)

    setText=GetData("Renew.SurvObj2")
    SetData("Renew.BriefObj2", setText)

    setText=GetData("Renew.SurvObj3")
    SetData("Renew.BriefObj3", setText)