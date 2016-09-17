package nslm2.modules.footstones.newerGuideModules
{
   import game.ui.commons.comps.others.NewerGuideCommonRenderUI;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.configs.ClientConfig;
   import flash.geom.Point;
   
   public class NewerGuideCommonRender extends NewerGuideCommonRenderUI
   {
      
      public static const ARROW_LENGTH:int = 90;
      
      public static const BG_WHITE_HEIGHT:int = 55;
      
      public static const BG_WHITE_WIDTH:int = 50;
       
      
      private var floatEff:FloatUpDownEffCtrl;
      
      private var _avatarBmc:BmcSpriteSheet;
      
      private var _fingerBmc:BmcSpriteSheet;
      
      public var txt_oriX:int;
      
      public var txt_oriY:int;
      
      public function NewerGuideCommonRender()
      {
         super();
         this.txt_oriX = this.txt_content.x;
         this.txt_oriY = this.txt_content.y;
         floatEff = new FloatUpDownEffCtrl().config(0.9).init(img_arrow,NaN,6,8);
         this.parts.push(new FloatUpDownEffCtrl().config(0.9).init(img_arrow,NaN,6,8));
         floatEff.pause();
         this.mouseEvent = false;
      }
      
      public function check_init_fingerBmc() : void
      {
         if(_fingerBmc == null && ClientConfig.firstBattle != 1)
         {
            _fingerBmc = new BmcSpriteSheet();
            _fingerBmc.setAnchor(0.5,0.5);
            _fingerBmc.init(6000005,1,"all",true);
            this.addChild(_fingerBmc);
         }
      }
      
      public function check_init_avatarBmc() : void
      {
         if(_avatarBmc == null && ClientConfig.firstBattle != 1)
         {
            _avatarBmc = new BmcSpriteSheet();
            _avatarBmc.setAnchor(0.5,0.5);
            _avatarBmc.init(6000004,1,"all",true);
            this.img_dialog.addChild(_avatarBmc);
         }
      }
      
      public function show(param1:Point, param2:int, param3:int, param4:String) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc8_:Point = new Point(0,0);
         if(this.box_arrow.visible)
         {
            floatEff.play();
            _loc6_ = new Point();
            switch(int(param2) - 1)
            {
               case 0:
                  _loc8_.x = _loc8_.x + param1.x;
                  _loc8_.y = _loc8_.y + param1.y / 2;
                  _loc5_ = 90;
                  _loc6_.x = -param1.x / 2;
                  break;
               default:
                  _loc8_.x = _loc8_.x + param1.x / 2;
                  _loc8_.y = _loc8_.y;
                  _loc5_ = 0;
                  _loc6_.y = param1.y / 2;
                  break;
               case 2:
               default:
                  _loc8_.x = _loc8_.x + param1.x / 2;
                  _loc8_.y = _loc8_.y + param1.y;
                  _loc5_ = 180;
                  _loc6_.y = -param1.y / 2;
                  break;
               case 4:
                  _loc8_.x = _loc8_.x;
                  _loc8_.y = _loc8_.y + param1.y / 2;
                  _loc5_ = -90;
                  _loc6_.x = param1.x / 2;
            }
            this.check_init_fingerBmc();
            if(_fingerBmc)
            {
               this._fingerBmc.visible = true;
               this._fingerBmc.play();
               this._fingerBmc.x = _loc6_.x;
               this._fingerBmc.y = _loc6_.y + 10;
            }
            this.box_arrow.rotation = _loc5_;
         }
         this.x = _loc8_.x;
         this.y = _loc8_.y;
         showTalk(param4);
         var _loc9_:Point = new Point();
         if(this.box_arrow.visible)
         {
            switch(int(param2) - 1)
            {
               case 0:
                  _loc9_.x = 90 - 50;
                  _loc9_.y = -this.box_txt.height / 2;
                  break;
               default:
                  _loc9_.x = -this.box_txt.width / 2;
                  _loc9_.y = -this.box_txt.height - 90 + 55;
                  break;
               case 2:
               default:
                  _loc9_.x = -this.box_txt.width / 2;
                  _loc9_.y = 90 - 55;
                  break;
               case 4:
                  _loc9_.x = -this.box_txt.width - 90 + 50;
                  _loc9_.y = -this.box_txt.height / 2;
            }
         }
         else
         {
            _loc9_.x = -this.box_txt.width / 2;
            _loc9_.y = -this.box_txt.height;
         }
         this.box_txt.x = _loc9_.x;
         this.box_txt.y = _loc9_.y;
         var _loc7_:Point = new Point();
         if(!(int(param3) - 5))
         {
            this.txt_bg.scaleX = -1;
            this.txt_bg.x = this.box_txt.width;
            _loc7_.x = this.box_txt.x;
            _loc7_.y = this.box_txt.y + this.box_txt.height - 42;
         }
         else
         {
            this.txt_bg.scaleX = 1;
            this.txt_bg.x = 0;
            _loc7_.x = this.box_txt.x + this.box_txt.width;
            _loc7_.y = this.box_txt.y + this.box_txt.height - 42;
         }
         this.check_init_avatarBmc();
         if(_avatarBmc != null)
         {
            _avatarBmc.visible = true;
            _avatarBmc.play();
         }
         this.img_dialog.x = _loc7_.x;
         this.img_dialog.y = _loc7_.y;
      }
      
      protected function showTalk(param1:String) : void
      {
         this.box_txt.visible = true;
         this.txt_content.text = param1;
         var _loc2_:int = this.txt_content.textWidth + 4;
         var _loc3_:int = this.txt_content.textHeight + 0;
         this.box_txt.width = Math.max(165,_loc2_ + txt_oriX * 2);
         this.box_txt.height = Math.max(64,_loc3_ + txt_oriY * 2);
         this.txt_bg.width = this.box_txt.width;
         this.txt_bg.height = this.box_txt.height;
         this.txt_content.x = (this.box_txt.width - _loc2_) / 2;
         this.txt_content.y = (this.box_txt.height - _loc3_) / 2;
      }
   }
}
