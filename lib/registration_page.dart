import 'dart:ui';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>(); //  الحقول الإجبارية
  int _currentStep = 0;

  //  القسم الأول (القائد)
  final _uniCtrl = TextEditingController();
  final _leaderNameCtrl = TextEditingController();
  final _leaderIdCtrl = TextEditingController();
  final _leaderEmailCtrl = TextEditingController();
  final _leaderStudentIdCtrl = TextEditingController();
  final _leaderPhoneCtrl = TextEditingController();
  String? _tuwaiqMembership;

  final List<String> _membershipOptions = [
    'نعم، في جامعة الإمام محمد بن سعود الإسلامية',
    'نعم، في جامعة الملك سعود',
    'نعم، في جامعة الأميرة نورة بنت عبدالرحمن',
    'لا',
  ];

  //  القسم الثاني (المشروع)
  final _projNameCtrl = TextEditingController();
  final _projDescCtrl = TextEditingController();
  final _projProblemCtrl = TextEditingController();
  final _projSolutionCtrl = TextEditingController();

  //   القسم الثالث (العضو الثاني)
  final _m2NameCtrl = TextEditingController();
  final _m2IdCtrl = TextEditingController();
  final _m2EmailCtrl = TextEditingController();
  final _m2StudentIdCtrl = TextEditingController();
  final _m2PhoneCtrl = TextEditingController();

  //   القسم الرابع (العضو الثالث)
  final _m3NameCtrl = TextEditingController();
  final _m3IdCtrl = TextEditingController();
  final _m3EmailCtrl = TextEditingController();
  final _m3StudentIdCtrl = TextEditingController();
  final _m3PhoneCtrl = TextEditingController();

  //   القسم الخامس (الإقرارات)
  bool _agree1 = false;
  bool _agree2 = false;
  bool _agree3 = false;
  bool _agree4 = false;


//  الكود المريب كلاود قال لي احطه
  @override
  void dispose() {
    _uniCtrl.dispose();
    _leaderNameCtrl.dispose();
    _leaderIdCtrl.dispose();
    _leaderEmailCtrl.dispose();
    _leaderStudentIdCtrl.dispose();
    _leaderPhoneCtrl.dispose();
    _projNameCtrl.dispose();
    _projDescCtrl.dispose();
    _projProblemCtrl.dispose();
    _projSolutionCtrl.dispose();
    _m2NameCtrl.dispose();
    _m2IdCtrl.dispose();
    _m2EmailCtrl.dispose();
    _m2StudentIdCtrl.dispose();
    _m2PhoneCtrl.dispose();
    _m3NameCtrl.dispose();
    _m3IdCtrl.dispose();
    _m3EmailCtrl.dispose();
    _m3StudentIdCtrl.dispose();
    _m3PhoneCtrl.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      if (_currentStep < 4) {
        setState(() {
          _currentStep++;
        });
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _submitForm() {
    if (_agree1 && _agree2 && _agree3 && _agree4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال طلب التسجيل بنجاح!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // العودة للصفحة الرئيسية
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يجب الموافقة على جميع الإقرارات والتعهدات لإتمام التسجيل',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0.0, -0.3),
              radius: 1.2,
              colors: [Color(0xFF4A3470), Color(0xFF2F264D), Color(0xFF1E1735)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                physics: const BouncingScrollPhysics(),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.18),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //   زر العودة
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _getSectionTitle(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white70,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // مؤشر التقدم
                              Row(
                                children: List.generate(5, (index) {
                                  return Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: _currentStep >= index
                                            ? const Color(0xFF80E3D7)
                                            : Colors.white.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              const SizedBox(height: 40),

                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: _buildCurrentSection(),
                              ),

                              const SizedBox(height: 50),

                              // أزرار التنقل (التالي / السابق)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (_currentStep > 0)
                                    ElevatedButton(
                                      onPressed: _previousStep,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white
                                            .withOpacity(0.1),
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          side: BorderSide(
                                            color: Colors.white.withOpacity(
                                              0.3,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'السابق',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )
                                  else
                                    const SizedBox.shrink(),

                                  ElevatedButton(
                                    onPressed: _currentStep == 4
                                        ? _submitForm
                                        : _nextStep,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF7B2CBF),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 40,
                                        vertical: 15,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Text(
                                      _currentStep == 4 ? 'سجل الآن' : 'التالي',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getSectionTitle() {
    switch (_currentStep) {
      case 0:
        return 'القسم الأول: الجامعة وقائد الفريق';
      case 1:
        return 'القسم الثاني: بيانات المشروع';
      case 2:
        return 'القسم الثالث: بيانات العضو الثاني';
      case 3:
        return 'القسم الرابع: بيانات العضو الثالث';
      case 4:
        return 'القسم الخامس: الإقرارات والتعهدات';
      default:
        return '';
    }
  }

  Widget _buildCurrentSection() {
    switch (_currentStep) {
      case 0:
        return Column(
          key: const ValueKey(0),
          children: [
            _buildTextField(
              'اسم الجامعة التي ينتمي إليها أعضاء الفريق',
              _uniCtrl,
            ),
            _buildTextField(
              'الاسم الثلاثي لقائد الفريق (باللغة العربية)',
              _leaderNameCtrl,
            ),
            _buildTextField(
              'رقم الهوية/الإقامة (لإصدار تصاريح الدخول)',
              _leaderIdCtrl,
            ),
            _buildTextField(
              'البريد الإلكتروني الشخصي',
              _leaderEmailCtrl,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField('الرقم الجامعي', _leaderStudentIdCtrl),
            _buildTextField(
              'رقم الجوال',
              _leaderPhoneCtrl,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            _buildDropdownField(
              'هل لديك عضوية في نادي طويق؟',
              _membershipOptions,
            ),
          ],
        );
      case 1:
        return Column(
          key: const ValueKey(1),
          children: [
            _buildTextField('اسم المشروع', _projNameCtrl),
            _buildTextField(
              'وصف تفصيلي للمشروع (الفكرة، كيف يعمل، المستفيدون)',
              _projDescCtrl,
              maxLines: 4,
            ),
            _buildTextField(
              'ما المشكلة التي يعالجها المشروع؟ ',
              _projProblemCtrl,
              maxLines: 2,
            ),
            _buildTextField(
              'ما الحل الذي يقدمه المشروع؟ ',
              _projSolutionCtrl,
              maxLines: 2,
            ),
          ],
        );
      case 2:
        return Column(
          key: const ValueKey(2),
          children: [
            _buildTextField('الاسم الثلاثي باللغة العربية', _m2NameCtrl),
            _buildTextField('رقم الهوية/الإقامة', _m2IdCtrl),
            _buildTextField(
              'البريد الإلكتروني الشخصي',
              _m2EmailCtrl,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField('الرقم الجامعي', _m2StudentIdCtrl),
            _buildTextField(
              'رقم الجوال',
              _m2PhoneCtrl,
              keyboardType: TextInputType.phone,
            ),
          ],
        );
      case 3:
        return Column(
          key: const ValueKey(3),
          children: [
            _buildTextField('الاسم الثلاثي باللغة العربية', _m3NameCtrl),
            _buildTextField('رقم الهوية/الإقامة', _m3IdCtrl),
            _buildTextField(
              'البريد الإلكتروني الشخصي',
              _m3EmailCtrl,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildTextField('الرقم الجامعي', _m3StudentIdCtrl),
            _buildTextField(
              'رقم الجوال',
              _m3PhoneCtrl,
              keyboardType: TextInputType.phone,
            ),
          ],
        );
      case 4:
        return Column(
          key: const ValueKey(4),
          children: [
            _buildCheckbox(
              'أقر بصحة جميع المعلومات الواردة في هذا النموذج، وأن الفريق يتكوّن من 3 أفراد من الجامعة نفسها.',
              _agree1,
              (val) => setState(() => _agree1 = val!),
            ),
            _buildCheckbox(
              'أقر بأنني حصلت على موافقة العضوين الآخرين على تقديم بياناتهما ضمن طلب المشاركة.',
              _agree2,
              (val) => setState(() => _agree2 = val!),
            ),
            _buildCheckbox(
              'أقر باطلاع جميع أعضاء الفريق على المواعيد الموضحة، وموافقتهم على الالتزام بالحضور.',
              _agree3,
              (val) => setState(() => _agree3 = val!),
            ),
            _buildCheckbox(
              'أتعهد بالتزام الفريق باستخدام منصة ريبليت في تطوير المشروع في حال التأهل.',
              _agree4,
              (val) => setState(() => _agree4 = val!),
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    IconData? icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller, // لحفظ البيانات عند التبديل بين الأقسام
        maxLines: maxLines,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        decoration: InputDecoration(
          //   النجمة الحمراء بجانب النص
          label: RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
                fontFamily: 'Arial',
              ),
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          prefixIcon: icon != null ? Icon(icon, color: Colors.white54) : null,
          filled: true,
          fillColor: Colors.white.withOpacity(0.08),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF80E3D7), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          ),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField<String>(
        value: _tuwaiqMembership,
        dropdownColor: const Color(0xFF2F264D),
        style: const TextStyle(color: Colors.white),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        validator: (value) {
          if (value == null) {
            return 'الرجاء اختيار إجابة';
          }
          return null;
        },
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 16,
                fontFamily: 'Arial',
              ),
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.08),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF80E3D7), width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.redAccent, width: 2),
          ),
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _tuwaiqMembership = newValue;
          });
        },
      ),
    );
  }

  Widget _buildCheckbox(String text, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
        ),
        child: CheckboxListTile(
          title: RichText(
            text: TextSpan(
              text: text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
                fontFamily: 'Arial',
              ),
              children: const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF80E3D7),
          checkColor: const Color(0xFF1E1735),
          controlAffinity: ListTileControlAffinity.leading,
        ),
      ),
    );
  }
}
