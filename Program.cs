using Aspose.Words.Fonts;
using System;
using System.Threading;

namespace AsposeAlpineTest
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Converting hardcoded document");

			ConvertWordToPdfa("/convert/arial.docx", "/convert/arial.pdf");

			Console.WriteLine("Conversion succeded. Keeping container alive for 1 hour if you want to inspect container.");
			
			Thread.Sleep(3600000);
		}

		private static void ConvertWordToPdfa(string fileToConvert, string destination)
		{
				var doc = new Aspose.Words.Document(fileToConvert);
				FontSettings.DefaultInstance.SetFontsFolder("/usr/share/fonts", true);
				FontSettings.DefaultInstance.SubstitutionSettings.DefaultFontSubstitution.DefaultFontName = "Arial";
				var options = new Aspose.Words.Saving.PdfSaveOptions
				{
					SaveFormat = Aspose.Words.SaveFormat.Pdf,
					Compliance = Aspose.Words.Saving.PdfCompliance.PdfA1b,
					ExportDocumentStructure = true // This will include Structured Document Tags (SDT) in the PDF.
				};
				doc.Save(destination, options);
		}
	}
}
