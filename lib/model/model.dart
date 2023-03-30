class todo {
  final String id;
  final String judul;
  final String desc;
  bool is_selesai;

  todo({
    required this.id,
    required this.judul,
    required this.desc,
    required this.is_selesai,
  });
}

List<todo> dataTodo = [
  todo(
    id: DateTime.now().toString(),
    judul: 'judul',
    desc: 'desc',
    is_selesai: false,
  ),
  todo(
    id: DateTime.now().toString(),
    judul: 'judul 1',
    desc: 'desc 1',
    is_selesai: false,
  ),
  todo(
    id: DateTime.now().toString(),
    judul: 'judul 2',
    desc: 'desc 2',
    is_selesai: false,
  ),
];
