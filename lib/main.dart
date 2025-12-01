import 'package:flutter/material.dart'; // เรียกใช้ชุดเครื่องมือสร้าง UI ของ Google (Material Design)

// จุดเริ่มต้นของแอปฯ ทุกแอปต้องเริ่มทำงานที่ฟังก์ชัน main
void main() {
  runApp(const MyApp()); // สั่งให้รันแอปฯ โดยเริ่มที่ Widget ชื่อ MyApp
}

// MyApp คือโครงสร้างหลักของแอปพลิเคชัน
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp คือตัวจัดการแอปฯ พื้นฐาน (ธีม, การนำทาง, ภาษา)
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ปิดป้ายคาด "Debug" มุมขวาบน เพื่อความสวยงาม
      title: 'Flutter Demo', // ชื่อแอปฯ เวลาพับหน้าจอ
      theme: ThemeData(
        // ตั้งค่าสีหลักของแอปให้เป็นโทนสีน้ำเงิน
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // ใช้ดีไซน์แบบใหม่ (Material 3)
      ),
      initialRoute: '/', // กำหนดว่าเปิดแอปมา ให้เริ่มที่หน้าไหน ( '/' คือหน้าแรก)
      routes: {
        // แผนที่การเดินทางในแอป
        '/': (context) => const MyHomePage(), // ถ้าไป '/' ให้โชว์หน้า MyHomePage
        '/second': (context) => const SecondPage(), // ถ้าไป '/second' ให้โชว์หน้า SecondPage
      },
    );
  }
}

// MyHomePage คือหน้าจอหลัก (หน้าโปรไฟล์)
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold คือโครงสร้างหน้าจอมาตรฐาน (มีพื้นหลังขาวให้ มีที่สำหรับใส่ Appbar หรือ Body)
    return Scaffold(
      // body คือส่วนเนื้อหาทั้งหมดในหน้านี้
      body: Column( // Column คือการเรียงของจาก "บนลงล่าง"
        children: [

          // --- ส่วนที่ 1: Header สีน้ำเงินด้านบน ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50), // เว้นระยะขอบในกล่อง (ซ้ายขวา 30, บนล่าง 50)
            width: double.infinity, // สั่งให้กล่องกว้างเต็มความกว้างหน้าจอ
            decoration: const BoxDecoration( // ใช้ตกแต่งกล่อง
              color: Color(0xFF1565C0), // ใส่สีพื้นหลัง (สีน้ำเงินเข้ม)
              borderRadius: BorderRadius.only( // สั่งให้มุมโค้งมน
                bottomLeft: Radius.circular(3), // โค้งมุมซ้ายล่าง
                bottomRight: Radius.circular(3), // โค้งมุมขวาล่าง
              ),
            ),
            child: Column( // เรียงเนื้อหาในส่วนหัว (ข้อความ -> รูป -> ชื่อ)
              children: [
                const Text(
                  "ข้อมูลส่วนตัว",
                  style: TextStyle( // กำหนดสไตล์ตัวหนังสือ
                    fontSize: 24, // ขนาดตัวอักษร
                    fontWeight: FontWeight.bold, // ตัวหนา
                    color: Colors.white, // สีขาว
                  ),
                ),
                const SizedBox(height: 20), // กล่องเปล่าๆ ใช้ดันระยะห่างระหว่างบรรทัด (20 pixel)

                // กรอบสีขาวรอบรูปโปรไฟล์
                Container(
                  padding: const EdgeInsets.all(4), // ขอบหนา 4 pixel
                  decoration: const BoxDecoration(
                    color: Colors.purpleAccent, // สีขอบ
                    shape: BoxShape.circle, // บังคับให้กล่องเป็นวงกลม
                  ),
                  child: ClipOval( // ตัวตัดรูปภาพให้เป็นวงกลม
                    child: Image.network( // โหลดรูปจากอินเทอร์เน็ต
                      "https://i.pinimg.com/736x/de/ab/ba/deabba62d809dc1b730be1babf5a1234.jpg",
                      width: 120, // ความกว้างรูป
                      height: 120, // ความสูงรูป
                      fit: BoxFit.cover, // สั่งให้รูปขยายเต็มวงกลมโดยไม่เสียสัดส่วน
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Theppitak Nitchimphli",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "theppitak.nitchimpee@e-tech.ac.th",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70, // สีขาวแบบจางๆ นิดหน่อย
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // --- ส่วนที่ 2: เนื้อหาข้อมูลติดต่อด้านล่าง ---
          // Expanded คือคำสั่งบอกว่า "พื้นที่ที่เหลือด้านล่างทั้งหมด ฉันจองนะ"
          Expanded(
            child: SingleChildScrollView( // ทำให้พื้นที่นี้ "เลื่อนขึ้นลงได้" (Scroll) ถ้ารายการยาวเกินจอ
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // เว้นขอบซ้ายขวาของเนื้อหาทั้งหมด
                child: Column(
                  children: [
                    // --- แถวที่ 1: เบอร์โทร ---
                    Row( // Row คือการเรียงของจาก "ซ้ายไปขวา"
                      children: [
                        // กล่องสี่เหลี่ยมพื้นหลังไอคอน
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green[100], // สีเขียวอ่อน
                            borderRadius: BorderRadius.circular(10), // มุมโค้งมนนิดๆ
                          ),
                          child: const Icon(Icons.phone, color: Colors.green, size: 28), // ไอคอนโทรศัพท์
                        ),
                        const SizedBox(width: 15), // เว้นระยะห่างระหว่างไอคอนกับตัวหนังสือ
                        // คอลัมน์สำหรับ "หัวข้อ" และ "ข้อมูล"
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // จัดตัวหนังสือชิดซ้าย
                          children: const [
                            Text("เบอร์โทรศัพท์", style: TextStyle(color: Colors.grey)),
                            Text("099-578-2150", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15), // เว้นระยะห่างระหว่างแถว

                    // --- แถวที่ 2: วันเกิด (ทำเหมือนเดิมเปลี่ยนแค่สีกับข้อมูล) ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.pink[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.cake, color: Colors.pink, size: 28),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("วันเกิด", style: TextStyle(color: Colors.grey)),
                            Text("06 กุมภาพันธ์ 2006", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // --- แถวที่ 3: ที่อยู่ ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.location_on, color: Colors.orange, size: 28),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("ที่อยู่", style: TextStyle(color: Colors.grey)),
                            Text("ชลบุรี", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // --- แถวที่ 4: การศึกษา ---
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.school, color: Colors.purple, size: 28),
                        ),
                        const SizedBox(width: 15),
                        // Expanded ตรงนี้สำคัญ: ถ้าชื่อโรงเรียนยาวเกินจอ มันจะช่วยปัดบรรทัดใหม่ให้ ไม่ให้ Error
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("การศึกษา", style: TextStyle(color: Colors.grey)),
                              Text("วิทยาลัยเทคโนโลยีภาคตะวันออก (อี.เทค)",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // --- ปุ่มเปลี่ยนหน้า ---
                    SizedBox(
                      width: double.infinity, // สั่งปุ่มกว้างเต็มจอ
                      height: 50, // ความสูงปุ่ม
                      child: ElevatedButton( // ปุ่มแบบยกนูน (มีเงา)
                        onPressed: () => Navigator.pushNamed(context, '/second'), // คำสั่งเปลี่ยนหน้าไปที่ '/second'
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0), // สีพื้นปุ่ม
                          foregroundColor: Colors.white, // สีตัวหนังสือในปุ่ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // ปุ่มขอบมน
                          ),
                        ),
                        child: const Text("ไปยังหน้า 2", style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ================== (SecondPage) ==================

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  // รายการ URL รูปภาพทั้งหมด (9 รูป) ที่รวบรวมมาจากลิงก์ Pinterest
  final List<String> imageUrls = const [
    "https://i.pinimg.com/1200x/71/33/85/71338549c0b909614424bf81c345071c.jpg",
    "https://i.pinimg.com/736x/d9/12/4e/d9124e0ba3e7179a1833da49dec5546e.jpg",
    "https://i.pinimg.com/736x/7b/fc/37/7bfc3717931bab5fdd81161ba013a9aa.jpg",
    "https://i.pinimg.com/736x/b3/a4/19/b3a4193287ae96dc8fd4b86fe7e4cbb2.jpg",
    "https://i.pinimg.com/1200x/ca/07/1a/ca071a34a3cebb4a986e80b73b31bb5f.jpg",
    "https://i.pinimg.com/736x/d5/85/3a/d5853aeb4f7d60d4f8b4d70c26abc776.jpg",
    "https://i.pinimg.com/736x/bf/2d/b5/bf2db50e1a5f8d4b41957e57ad32ffd6.jpg",
    "https://i.pinimg.com/originals/1a/4c/5b/1a4c5bb4855f4d06caa78471692c5f9a.gif",
    "https://i.pinimg.com/736x/0e/82/8d/0e828d25efbbd8a5ebb4690160e506af.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // --- ส่วนหัว (AppBar) ธีมสีน้ำเงิน ---
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // ย้อนกลับหน้าแรก
          },
        ),
        title: const Text(
          "โปรไฟล์",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // --- ส่วนที่ 1: ข้อมูลโปรไฟล์ (รูปภาพ + สถิติ) ---
              Row(
                children: [
                  // รูปโปรไฟล์
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/de/ab/ba/deabba62d809dc1b730be1babf5a1234.jpg",
                    ),
                  ),
                  const SizedBox(width: 20),
                  // สถิติต่างๆ
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn("5", "กำลังติดตาม"),
                        _buildStatColumn("828.1 K", "ผู้ติดตาม"),
                        _buildStatColumn("329.9 K", "ถูกใจ"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // --- ส่วนที่ 2: ชื่อและติ๊กถูก ---
              Row(
                children: const [
                  Text(
                    "Theppitak_Nitchimpee",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.verified, color: Colors.blue, size: 20),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.music_note, size: 16, color: Colors.grey[600]),
                  Text(" lnwza007", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
              const SizedBox(height: 20),

              // --- ส่วนที่ 3: ปุ่มกด (ติดตาม & แชร์) ---
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "ติดตาม",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // ปุ่มแชร์ (กรอบ)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.share, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- ส่วนที่ 4: ตารางรูปภาพ (GridView.builder) ---
              // GridView.builder เหมาะกับการแสดงรายการรูปภาพจาก List/Array
              GridView.builder(
                shrinkWrap: true, // กำหนดให้ GridView ใช้พื้นที่เท่าที่จำเป็น (สำคัญมากเมื่ออยู่ใน SingleChildScrollView)
                physics: const NeverScrollableScrollPhysics(), // ปิดการ Scroll ของ GridView
                // กำหนดโครงสร้างของตารางรูปภาพ
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // **แสดง 3 รูปต่อแถว** ตามที่ผู้ใช้ร้องขอ
                  crossAxisSpacing: 8, // ระยะห่างระหว่างรูปในแนวนอน
                  mainAxisSpacing: 8, // ระยะห่างระหว่างรูปในแนวตั้ง
                  childAspectRatio: 2.8 / 3.8, // สัดส่วนของแต่ละช่อง (กว้าง 3, สูง 4) เพื่อให้รูปเป็นแนวตั้ง
                ),
                itemCount: imageUrls.length, // จำนวนรูปภาพที่จะแสดง (จาก List ที่เราเตรียมไว้)
                itemBuilder: (context, index) {
                  // สร้าง Widget สำหรับรูปภาพแต่ละรูป
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(2), // ขอบมน
                    child: Image.network(
                      imageUrls[index], // ดึง URL รูปภาพจาก List โดยใช้ index
                      fit: BoxFit.cover, // ให้รูปภาพขยายเต็มพื้นที่ช่องโดยไม่เสียสัดส่วน
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันเสริม สร้างแท่งสถิติ
  Widget _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}