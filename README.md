# AsposeAlpineTest

This is not working, giving error message:
Unhandled exception. System.TypeLoadException: Cannot load type 'System.Void, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.
   at ☻ .☻(Int32 ☻, ♠ ♥, Boolean& ♣, Boolean)
   at ☻ .☻(Int32 ☻, Boolean ♥)
   at ☻ .☻(Int32 ☻, ♠ ♥)
   at ☻ .☻(Int32 ☻)
   at ☻   (☻  ☻, ☻  ♥)
   at ☻ .♣()
   at ☻ .♠ (Boolean ☻)
   at Aspose.Words.Document.♥(Stream ☻, LoadOptions ♥)
   at Aspose.Words.Document.☻(Stream ☻, LoadOptions ♥)
   at Aspose.Words.Document..ctor(String fileName, LoadOptions loadOptions)
   at Aspose.Words.Document..ctor(String fileName)
   at AsposeAlpineTest.Program.ConvertWordToPdfa(String fileToConvert, String destination)
   at AsposeAlpineTest.Program.Main(String[] args)

Prerequisites:
yarn
netcore3.1 SDK
docker in Linux container mode

Steps to reproduce:
1. Clone repo
2. run 'yarn'
3. run 'yarn publish'
4. run 'docker build .'
5. run 'docker images' and find the image ID of the image created in step 4
6. run 'docker run <id from step 5>'

Tips:
If you want to inspect container before it is executing, run 'docker run -it <id from step 5> sh'