import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Text(
              '🧸',
              style: TextStyle(fontSize: 80),
            ),
            SizedBox(height: 12),
            Text(
              'Collection of Happiness',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A574),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Your personal diary of joy',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            _buildInfoCard(
              emoji: '✨',
              title: 'Capture Moments',
              description: 'Write down the little things that made you smile today',
            ),
            SizedBox(height: 12),
            _buildInfoCard(
              emoji: '💖',
              title: 'Daily Happiness',
              description: 'Build a collection of positive memories, one day at a time',
            ),
            SizedBox(height: 12),
            _buildInfoCard(
              emoji: '🌟',
              title: 'Reflect & Grow',
              description: 'Look back and remember all the good times that made life beautiful',
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF5E6D3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    '💡 Tips',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD4A574),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Write something every day, no matter how small\n'
                    '• Be specific - details make memories vivid\n'
                    '• Don\'t just write big moments, small joys count too!\n'
                    '• Read your past entries when you need a smile',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8B6F47),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Remember: Happiness is not by chance,\nbut by choice 🌈',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFFD4A574),
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Divider(color: Color(0xFFF5E6D3), thickness: 2),
            SizedBox(height: 20),
            Text(
              'Made with 💖 for you',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String emoji,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD4A574).withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFF5E6D3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(emoji, style: TextStyle(fontSize: 28)),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A574),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
