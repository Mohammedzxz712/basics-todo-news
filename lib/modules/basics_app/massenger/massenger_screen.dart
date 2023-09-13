import 'package:flutter/material.dart';

class MassengerScreen extends StatelessWidget {
  const MassengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 18,
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chat',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 16,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ))),
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 16,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ))),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(5),

                  //color: Colors.grey.shade600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.grey[350]),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      Text(
                        'search',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => const Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                'https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/330428924_765142874533408_8094820109682825282_n.jpg?_nc_cat=107&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=f0oRJ946rncAX-Bi-OI&_nc_ht=scontent.fcai20-6.fna&oh=00_AfBGucoq1f94Nr2jl6DRU6dqjou1p84BICjdFmQpkVh2_Q&oe=649A5618',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3, right: 5),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Mohamed Abdullah Ali Abdullah Rageh',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                //maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      ' call to OpenGL ES API with no current context logged once per thread  call to OpenGL ES API with no current context logged once per thread',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 3,
                                  ),
                                  Text(
                                    '22:00 pm',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    itemCount: 20,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       Container(
                //         width: 77,
                //         child: const Column(
                //           children: [
                //             Stack(
                //               alignment: AlignmentDirectional.bottomEnd,
                //               children: [
                //                 CircleAvatar(
                //                     radius: 30,
                //                     backgroundImage: NetworkImage(
                //                         'https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/330428924_765142874533408_8094820109682825282_n.jpg?_nc_cat=107&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=f0oRJ946rncAX-Bi-OI&_nc_ht=scontent.fcai20-6.fna&oh=00_AfBGucoq1f94Nr2jl6DRU6dqjou1p84BICjdFmQpkVh2_Q&oe=649A5618')),
                //                 Padding(
                //                   padding: EdgeInsetsDirectional.only(
                //                     bottom: 2,
                //                     end: 3,
                //                   ),
                //                   child: CircleAvatar(
                //                     radius: 7,
                //                     backgroundColor: Colors.red,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Text(
                //               'Mohamed Abdullah Ali',
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ],
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 17,
                //       ),
                //       const SizedBox(
                //         width: 77,
                //         child: Column(
                //           children: [
                //             Stack(
                //               alignment: AlignmentDirectional.bottomEnd,
                //               children: [
                //                 CircleAvatar(
                //                   radius: 30,
                //                   backgroundImage: NetworkImage(
                //                       'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                //                 ),
                //                 Padding(
                //                   padding: EdgeInsetsDirectional.only(
                //                     bottom: 2,
                //                     end: 3,
                //                   ),
                //                   child: CircleAvatar(
                //                     radius: 7,
                //                     backgroundColor: Colors.red,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Text(
                //               'Mohamed Abdullah Ali',
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: 17,
                //       ),
                //       Container(
                //         width: 77,
                //         child: Column(
                //           children: [
                //             Stack(
                //               alignment: AlignmentDirectional.bottomEnd,
                //               children: [
                //                 CircleAvatar(
                //                   radius: 30,
                //                   backgroundImage: NetworkImage(
                //                       'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsetsDirectional.only(
                //                     bottom: 2,
                //                     end: 3,
                //                   ),
                //                   child: CircleAvatar(
                //                     radius: 7,
                //                     backgroundColor: Colors.red,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Text(
                //               'Mohamed Abdullah Ali',
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: 17,
                //       ),
                //       Container(
                //         width: 77,
                //         child: Column(
                //           children: [
                //             Stack(
                //               alignment: AlignmentDirectional.bottomEnd,
                //               children: [
                //                 CircleAvatar(
                //                   radius: 30,
                //                   backgroundImage: NetworkImage(
                //                       'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsetsDirectional.only(
                //                     bottom: 2,
                //                     end: 3,
                //                   ),
                //                   child: CircleAvatar(
                //                     radius: 7,
                //                     backgroundColor: Colors.red,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Text(
                //               'Mohamed Abdullah Ali',
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: 17,
                //       ),
                //       Container(
                //         width: 77,
                //         child: Column(
                //           children: [
                //             Stack(
                //               alignment: AlignmentDirectional.bottomEnd,
                //               children: [
                //                 CircleAvatar(
                //                   radius: 30,
                //                   backgroundImage: NetworkImage(
                //                       'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsetsDirectional.only(
                //                     bottom: 2,
                //                     end: 3,
                //                   ),
                //                   child: CircleAvatar(
                //                     radius: 7,
                //                     backgroundColor: Colors.red,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Text(
                //               'Mohamed Abdullah Ali',
                //               maxLines: 2,
                //               overflow: TextOverflow.ellipsis,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
*
              const Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            'https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/330428924_765142874533408_8094820109682825282_n.jpg?_nc_cat=107&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=f0oRJ946rncAX-Bi-OI&_nc_ht=scontent.fcai20-6.fna&oh=00_AfBGucoq1f94Nr2jl6DRU6dqjou1p84BICjdFmQpkVh2_Q&oe=649A5618'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3, right: 5),
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.green,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Mohamed Abdullah Ali Abdullah Rageh',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          //maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                ' call to OpenGL ES API with no current context logged once per thread  call to OpenGL ES API with no current context logged once per thread',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 3,
                            ),
                            Text(
                              '22:00 pm',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),

*
*
* */
