# iOS8

![image](https://github.com/kchvbf/iOS8/assets/109752188/db38c8ef-db27-4d0d-a297-4045ca9b3856)

![image](https://github.com/kchvbf/iOS8/assets/109752188/f0d69238-4e5f-4dcb-9359-9be6372b44fa)

![image](https://github.com/kchvbf/iOS8/assets/109752188/cc894fac-145d-478e-b151-27e124349250)

- Статья объясняет разницу между слабыми, сильными и несвязанными ссылками в списках захвата в Swift.
- Списки захвата используются в замыканиях, чтобы определить, как значения из внешней среды должны быть захвачены замыканием.
- По умолчанию Swift использует сильный захват, который означает, что замыкание сохраняет любые внешние значения, которые оно использует, и не дает им быть уничтоженными.
- Альтернативой сильному захвату является слабый захват, который означает, что замыкание не сохраняет внешние значения, и они могут быть уничтожены и установлены в nil. Поэтому слабо захваченные значения всегда являются опциональными в Swift.
- Еще одним вариантом является несвязанный захват, который похож на слабый захват, но не делает значения опциональными. Однако, если значение уничтожено, то при обращении к нему через несвязанную ссылку произойдет ошибка времени выполнения.
