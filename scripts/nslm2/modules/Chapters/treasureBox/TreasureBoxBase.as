package nslm2.modules.Chapters.treasureBox
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mediators.RollHighLightMediator;
   
   public class TreasureBoxBase extends View
   {
       
      
      public var img_icon:Image;
      
      private var _canRewardEffect:BmcSpriteSheet;
      
      public function TreasureBoxBase()
      {
         super();
         this.buttonMode = true;
         img_icon = new Image();
         this.addChild(new Image());
         this.parts.push(new RollHighLightMediator(this));
      }
      
      public function get vo() : TreasureBoxVo
      {
         return this.dataSource as TreasureBoxVo;
      }
      
      public function set vo(param1:TreasureBoxVo) : void
      {
         this.dataSource = param1;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            switch(int(vo.state) - 1)
            {
               case 0:
                  this.img_icon.skin = TreasureBoxModel.ins.closeUrl(2);
                  if(_canRewardEffect)
                  {
                     DisplayUtils.removeSelf(_canRewardEffect);
                  }
                  break;
               case 1:
                  this.img_icon.skin = TreasureBoxModel.ins.closeUrl(2);
                  if(_canRewardEffect == null)
                  {
                     _canRewardEffect = new BmcSpriteSheet();
                     _canRewardEffect.init(9003,1,"all",true);
                  }
                  _canRewardEffect.x = -43;
                  _canRewardEffect.y = -36;
                  this.addChild(_canRewardEffect);
                  break;
               case 2:
                  this.img_icon.skin = TreasureBoxModel.ins.closeUrl(2);
                  if(_canRewardEffect)
                  {
                     DisplayUtils.removeSelf(_canRewardEffect);
                  }
                  break;
               case 3:
                  this.img_icon.skin = TreasureBoxModel.ins.closeUrl(2);
                  if(_canRewardEffect)
                  {
                     DisplayUtils.removeSelf(_canRewardEffect);
                     break;
                  }
            }
         }
      }
   }
}
