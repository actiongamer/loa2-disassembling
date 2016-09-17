package morn.customs
{
   import flash.filters.GlowFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.BlurFilter;
   import com.mz.core.utils.FilterUtil;
   
   public class FilterLib
   {
      
      public static const STROKE_NONE:String = "无";
      
      public static const STROKE_BLACK_1PX:String = "黑色1像素描边";
      
      public static const STROKE_KHAKI_1PX:String = "卡其色1像素描边";
      
      public static const TEXT_STROKE_BLACK:int = 101;
      
      public static const TEXT_STROKE_GRAY:int = 102;
      
      public static const TEXT_STROKE_BROWN:int = 103;
      
      public static const TEXT_GROW_GRAY:int = 104;
      
      public static const TEXT_STROKE_YELLOW:int = 105;
      
      public static const TEXT_STROKE_GRAY_2:int = 106;
      
      public static const TEXT_DROP_SHADOW_UP:int = 201;
      
      public static const TEXT_GROW_SELECTED:int = 301;
      
      public static const TEXT_GROW_PURPLE:int = 302;
      
      public static const TEXT_GROW_BLUE:int = 303;
      
      public static const IMG_GRAY:int = 401;
      
      public static const IMG_BLACKWHITE:int = 402;
      
      public static const macBrushFilter:GlowFilter = new GlowFilter(0,0.8,1.5,1.5,10);
      
      public static const brushFilter:GlowFilter = new GlowFilter(0,1,2,2,10);
      
      public static const TEXT_DROP_SHADOW:DropShadowFilter = new DropShadowFilter(0,45,0,1,3,3,2.5);
      
      public static const BORDER_BLACK:GlowFilter = new GlowFilter(0,1,2,2,6);
      
      public static const COLOR_MATRIX_FILM:ColorMatrixFilter = new ColorMatrixFilter([-1,0,0,0,255,0,-1,0,0,255,0,0,-1,0,255,0,0,0,1,1]);
      
      public static const COLOR_MATRIX_LIGHT:ColorMatrixFilter = new ColorMatrixFilter([1,0.8,0,0,0,0,1,0.75,0,0,0,0,1,0,0,0,0,0,1,0]);
      
      public static const COLOR_MATRIX_BLACK:ColorMatrixFilter = new ColorMatrixFilter([0.5,0,0,0,0,0,0.5,0,0,0,0,0,0.5,0,0,0,0,0,1,0]);
      
      public static const BUTTON_OVER_STATE:ColorMatrixFilter = FilterUtil.highLightFilter(10);
      
      public static const BUTTON_DOWN_STATE:ColorMatrixFilter = COLOR_MATRIX_BLACK;
      
      public static const BUTTON_OVER_STATE_20:ColorMatrixFilter = FilterUtil.highLightFilter(20);
      
      public static const BORDER_YELLOW:GlowFilter = new GlowFilter(16776960,1,8,8,6);
      
      public static const BORDER_ORANGE:GlowFilter = new GlowFilter(16750848,1,8,8,6);
      
      public static const BORDER_YELLOW_2:GlowFilter = new GlowFilter(16776960,1,2,2,4);
      
      public static const TEXT_GROW_SELECTED_FILTER:GlowFilter = new GlowFilter(16776960,1,16,16,1);
      
      public static const TEXT_GROW_SELECTED_FILTER_INNER:GlowFilter = new GlowFilter(16776960,1,16,16,1,1,true);
      
      public static const TEXT_GROW_SELECTED_FILTER_WHITE:GlowFilter = new GlowFilter(16777215,1,16,16,1);
      
      public static const TEXT_GROW_SELECTED_FILTER_PURPLE:GlowFilter = new GlowFilter(16711935,1,16,16,1);
      
      public static const TEXT_GROW_SELECTED_FILTER_PURPLE_INNER:GlowFilter = new GlowFilter(16711935,1,16,16,1,1,true);
      
      public static const TEXT_GROW_SELECTED_FILTER_BLUE:GlowFilter = new GlowFilter(4827135,1,16,16,1);
      
      public static const TEXT_GROW_SELECTED_FILTER_YELLOW:GlowFilter = new GlowFilter(16776960,1,16,16,1);
      
      public static const TEXT_GROW_SELECTED_FILTER_ORANGE:GlowFilter = new GlowFilter(16542720,1,16,16,1);
      
      public static const TEXT_GROW_SELECTED_FILTER_BLUE_INNER:GlowFilter = new GlowFilter(4827135,1,16,16,1,1,true);
      
      public static const BORDER_RED:GlowFilter = new GlowFilter(16726560,1,6,8,2,1,false,false);
      
      public static const sceneBlurFilter:BlurFilter = new BlurFilter(4,4,1);
      
      public static const fakeGaussianFilter:BlurFilter = new BlurFilter(4,4,3);
      
      private static var _ins:morn.customs.FilterLib;
       
      
      private var lib:Object;
      
      public function FilterLib()
      {
         lib = {};
         super();
         lib["无"] = [];
         lib["黑色1像素描边"] = [new GlowFilter(0,1,2,2,10)];
         lib["卡其色1像素描边"] = [new GlowFilter(5256244,1,2,2,10)];
         lib[101] = [new GlowFilter(0,1,2,2,10)];
         lib[102] = [new GlowFilter(2038297,1,2,2,10)];
         lib[106] = [new GlowFilter(4013373,1,2,2,10)];
         lib[103] = [new GlowFilter(4063744,1,2,2,10)];
         lib[105] = [new GlowFilter(14595185,1,2,2,10)];
         lib[104] = [new GlowFilter(6710886,1,11,11,1.2)];
         lib[201] = [new DropShadowFilter(1,-90,0,0.75,2,2,1)];
         lib[301] = [TEXT_GROW_SELECTED_FILTER,TEXT_GROW_SELECTED_FILTER_INNER];
         lib[302] = [TEXT_GROW_SELECTED_FILTER_PURPLE,TEXT_GROW_SELECTED_FILTER_PURPLE_INNER];
         lib[303] = [TEXT_GROW_SELECTED_FILTER_BLUE,TEXT_GROW_SELECTED_FILTER_BLUE_INNER];
         lib[402] = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0])];
         lib[401] = [FilterUtil.highLightFilter(-30)];
      }
      
      public static function get ins() : morn.customs.FilterLib
      {
         if(_ins == null)
         {
            _ins = new morn.customs.FilterLib();
         }
         return _ins;
      }
      
      public function getFilterArr(param1:*) : Array
      {
         return lib[param1];
      }
      
      public function getRollGrowByColor(param1:uint) : GlowFilter
      {
         return new GlowFilter(param1,1,12,12,2,2);
      }
   }
}
