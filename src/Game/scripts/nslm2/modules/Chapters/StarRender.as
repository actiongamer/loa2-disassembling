package nslm2.modules.Chapters
{
   import game.ui.chapters.StarRenderUI;
   import com.mz.core.utils.FilterUtil;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class StarRender extends StarRenderUI
   {
      
      public static const STAR_URL:String = "png.uiChapter.dungeonMap.img_star";
      
      public static const STAR_URL_S2:String = "png.uiChapter.dungeonMap.img_starS2";
       
      
      public function StarRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(param1 != null)
         {
            switch(int(param1 as int))
            {
               case 0:
                  this.img_star.filters = [FilterUtil.grayFilter()];
                  this.img_star.visible = true;
                  break;
               case 1:
                  this.img_star.filters = null;
                  this.img_star.visible = true;
                  break;
               case 2:
                  this.img_star.visible = false;
                  _loc2_ = new BmcSpriteSheet();
                  _loc2_.init(4040003,1,"all",true);
                  var _loc3_:* = this.img_star.url;
                  if("png.uiChapter.dungeonMap.img_star" !== _loc3_)
                  {
                     if("png.uiChapter.dungeonMap.img_starS2" === _loc3_)
                     {
                        _loc2_.scaleX = 0.48;
                        _loc2_.scaleY = 0.48;
                        _loc2_.x = 5;
                        _loc2_.y = 5;
                        this.addChild(_loc2_);
                        break;
                     }
                     break;
                  }
                  _loc2_.scaleX = 0.8;
                  _loc2_.scaleY = 0.8;
                  _loc2_.x = -1;
                  _loc2_.y = -2;
                  this.addChild(_loc2_);
                  break;
            }
         }
      }
   }
}
