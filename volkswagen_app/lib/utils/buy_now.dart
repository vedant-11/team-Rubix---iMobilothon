import 'package:flutter/material.dart';

var colors = [
  Color(0xFFC4C4C4),
  Colors.black,
  Color(0xFFB64A28),
  Color(0xFF04063D),
  Color(0xFF2850B6)
];

class BuyNow extends StatelessWidget {
  const BuyNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(19), topLeft: Radius.circular(19)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 21,
          ),
          Text(
            'Smooth, Strong and Reliable',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Available Colors',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8A8181),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: colors.map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: e,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    spreadRadius: 1.5,
                                    color: Color(0xFFF6EAEA).withOpacity(0.45),
                                    offset: Offset(0, 0))
                              ]),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Customize',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8A8181),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF8A8181)),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/idr.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Touring',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF8A8181),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$110k',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFAEAEAE),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                height: 88,
                width: 104,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Color(0xFFC4C4C4),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: 96,
                      color: Colors.black,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Base',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFC4C4C4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '\$100k',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'Premium',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF8A8181),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '\$150k',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFAEAEAE),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 71,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {},
                color: Color(0xFFD31313).withOpacity(0.64),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                'Finace with loan',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8A8181),
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFA39E9E)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
