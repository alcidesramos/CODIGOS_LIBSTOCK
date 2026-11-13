#include "main.h"

#ifndef __TFT_H__
#define __TFT_H__

#ifdef __cplusplus
extern "C"
{
#endif

//lo puse yo
//coloque PUERTO SPI A USAR
#define TFT_SPI hspi1

//lo puse yo
//posicion de la TFT
#define Vertical 0
#define Horizontal 1
#define Vertical_Inv 2
#define Horizontal_Inv 3


extern SPI_HandleTypeDef TFT_SPI;

#include <stdint.h>

    typedef struct
    {
        uint16_t width;   // TFT 宽度
        uint16_t height;  // TFT 高度
        uint32_t id;      // TFT ID
        uint8_t dir;      // 横屏还是竖屏控制：0，竖屏；1，横屏。
        uint16_t wramcmd; // 开始写gram指令
        uint16_t setxcmd; // 设置x坐标指令
        uint16_t setycmd; // 设置y坐标指令
    } _TFT_dev;

    // TFT参数
    extern _TFT_dev TFTdev; // 管理TFT重要参数
/////////////////////////////////////用户配置区///////////////////////////////////
#define USE_HORIZONTAL 0 // 定义液晶屏顺时针旋转方向 	0-0度旋转，1-90度旋转，2-180度旋转，3-270度旋转

//////////////////////////////////////////////////////////////////////////////////
// 定义TFT的尺寸
#define TFT_W 240
#define TFT_H 320

// 画笔颜色
#define WHITE 0xFFFF
#define BLACK 0x0000
#define BLUE 0x001F
#define BRED 0XF81F
#define GRED 0XFFE0
#define GBLUE 0X07FF
#define RED 0xF800
#define MAGENTA 0xF81F
#define GREEN 0x07E0
#define CYAN 0x7FFF
#define YELLOW 0xFFE0
#define BROWN 0XBC40 // 棕色
#define BRRED 0XFC07 // 棕红色
#define GRAY 0X8430  // 灰色

// GUI颜色
#define DARKBLUE 0X01CF  // 深蓝色
#define LIGHTBLUE 0X7D7C // 浅蓝色
#define GRAYBLUE 0X5458  // 灰蓝色
// 以上三色为PANEL的颜色
#define LIGHTGREEN 0X841F // 浅绿色
#define LIGHTGRAY 0XEF5B  // 浅灰色(PANNEL)
#define LGRAY 0XC618      // 浅灰色(PANNEL),窗体背景色
#define LGRAYBLUE 0XA651  // 浅灰蓝色(中间层颜色)
#define LBBLUE 0X2B12     // 浅棕蓝色(选择条目的反色)

    void TFT_RESET(void);
    void TFT_WR_REG(uint8_t reg);
    void TFT_WR_DATA(uint8_t data);
    void TFT_WriteReg(uint8_t reg, uint16_t regdata);
    void TFT_WriteRAM_Prepare(void);
    void TFT_WriteData_16Bit(uint16_t Data);
    void TFT_direction(uint8_t direction);
    void TFT_SetWindows(uint16_t xStar, uint16_t yStar, uint16_t xEnd, uint16_t yEnd);
    void TFT_SetCursor(uint16_t Xpos, uint16_t Ypos);
    void TFT_Clear(uint16_t Color);
    void TFT_Fill(uint16_t xsta, uint16_t ysta, uint16_t xend, uint16_t yend, uint16_t color);
    void TFT_DrawPoint(uint16_t x, uint16_t y, uint16_t color);
    void TFT_DrawLine(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t color);
    void TFT_DrawRectangle(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t color);
    void TFT_DrawCircle(uint16_t x0, uint16_t y0, uint8_t r, uint16_t color);
    void TFT_ShowChar(uint16_t x, uint16_t y, uint8_t num, uint16_t fc, uint16_t bc, uint8_t sizey, uint8_t mode);
    void TFT_ShowString(uint16_t x, uint16_t y, const uint8_t *p, uint16_t fc, uint16_t bc, uint8_t sizey, uint8_t mode);
    void TFT_ShowIntNum(uint16_t x, uint16_t y, uint16_t num, uint8_t len, uint16_t fc, uint16_t bc, uint8_t sizey);
    void TFT_ShowPicture(uint16_t x, uint16_t y, uint16_t length, uint16_t width, const uint8_t pic[]);

    uint32_t TFT_Get_Id(void);
    void TFT_Init(void);

#ifdef __cplusplus
}
#endif
#endif
