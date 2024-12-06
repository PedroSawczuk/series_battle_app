import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:series_battle/services/rankingServices.dart';

class PdfServices {
  final RankingService _rankingService = RankingService();

  Future<void> generateRankingPdf() async {
    try {
      // Obter os dados de ranking do serviço
      List<Map<String, dynamic>> ranking = await _rankingService.getRanking();

      if (ranking.isEmpty) {
        // Se não houver dados, mostrar mensagem para o usuário
        print("Não há dados de ranking para gerar o PDF.");
        return;
      }

      final pdf = pw.Document();

      // Criar o cabeçalho do PDF
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Ranking das Batalhas', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 20),
                pw.Table.fromTextArray(
                  headers: ['Posição', 'Série', 'Vitórias'],
                  data: List.generate(
                    ranking.length,
                    (index) {
                      return [
                        index + 1,
                        ranking[index]['series_name'],
                        ranking[index]['wins'].toString(),
                      ];
                    },
                  ),
                  cellAlignment: pw.Alignment.centerLeft,
                  border: pw.TableBorder.all(width: 1),
                  headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
              ],
            );
          },
        ),
      );

      // Imprimir o PDF
      await Printing.layoutPdf(onLayout: (format) async => pdf.save());
    } catch (e) {
      print("Erro ao gerar o PDF: $e");
    }
  }
}
