#include <stdio.h>

int main() {
    int number;
    while (1) {
        printf("عدد صحیح وارد کنید (یا 'q' برای خارج شدن): ");
        int result = scanf("%d", &number);
        if (result == 1) {
            printf("'%d' وارد شد\n", number);
        } else {
            char c;
            scanf("%c", &c); // Clear input buffer
            if (c == 'q' || c == 'Q') {
                break; // Exit the loop if 'q' or 'Q' is entered
            }
            printf("عبارت وارد شده درست نیست.\n");
        }
    }
    return 0;
}
