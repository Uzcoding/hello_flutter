import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20.0,
                      icon: Image.asset(
                        'assets/images/menu.png',
                        width: 22.0,
                        height: 11.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/basket.png',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 3.0),
                        const Text('My basket'),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hello Tony, ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF27214D),
                          ),
                        ),
                        TextSpan(
                          text: 'What fruit salad\ncombo do you want today?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF27214D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: const Color(0xFFF3F4F9),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 26.0,
                          ),
                          hintText: 'Search for fruit salad combos',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20.0,
                      icon: Image.asset(
                        'assets/images/filter.png',
                        width: 26.0,
                        height: 17.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                const Text(
                  'Recommended Combo',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 210.0,
            child: ListView.separated(
              clipBehavior: Clip.none,
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(width: 23.0),
              itemBuilder: (context, index) => Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(16.0).copyWith(bottom: 18.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 6),
                      blurRadius: 6.0,
                      color: const Color(0xFF202020).withOpacity(.05),
                    )
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 120.0,
                      child: Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              debugPrint('Favorite pressed');
                            },
                            child: Image.asset(
                              'assets/images/favorite.png',
                              width: 16.0,
                              height: 14.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/product.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Honey lime combo'),
                    ),
                    SizedBox(
                      width: 120.0,
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/n-icon.png'),
                          const Text('2,000'),
                          const Spacer(),
                          SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: const Color(0xFFFFF2E7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Color(0xFFFFA451),
                                size: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40.0),
          const CategoryButtons()
        ],
      ),
    );
  }
}

class CategoryButtons extends StatefulWidget {
  const CategoryButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  int selectedCategoryIndex = 0;

  void selectCategory(int newIndex) {
    selectedCategoryIndex = newIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          3,
          (index) => CategoryButton(
            isActive: index == selectedCategoryIndex,
            hasPadding: index != 2,
            onPressed: () {
              selectCategory(index);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    this.isActive = false,
    this.hasPadding = true,
    required this.onPressed,
  }) : super(key: key);

  final bool hasPadding;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: hasPadding ? 30.0 : 0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero, foregroundColor: Colors.grey.shade300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AnimatedDefaultTextStyle(
              duration: kThemeChangeDuration,
              style: isActive
                  ? const TextStyle(
                      fontSize: 24.0,
                      color: Color(0xFF27214D),
                      fontWeight: FontWeight.w500,
                    )
                  : const TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF938DB5),
                      fontWeight: FontWeight.normal,
                    ),
              child: const Text(
                'Hottest',
                // style: TextStyle(
                //   fontSize: isActive ? 24.0 : 16.0,
                //   color: isActive
                //       ? const Color(0xFF27214D)
                //       : const Color(0xFF938DB5),
                //   fontWeight: FontWeight.w500,
                // ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              width: isActive ? 22.0 : 0,
              height: 2.0,
              color: const Color(0xFFFFA451),
            )
          ],
        ),
      ),
    );
  }
}
