package nslm2.common.ui.components.comps2d.others
{
   import game.ui.commons.comps.others.TreasureBoxBaseRenderUI;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxVo;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.Chapters.treasureBox.TreasureBoxModel;
   import com.mz.core.mediators.RollMediator;
   
   public class TreasureBoxBaseRender extends TreasureBoxBaseRenderUI
   {
       
      
      public var treasureType:int;
      
      private var _canRewardEffect:BmcSpriteSheet;
      
      private var _openEffect:BmcSpriteSheet;
      
      private var _nowState:int;
      
      public function TreasureBoxBaseRender()
      {
         super();
         this.parts.push(new RollMediator(this,onRoll));
         this.btn_reward.bg.smoothing = true;
      }
      
      public function get nowState() : int
      {
         return _nowState;
      }
      
      private function onRoll(param1:Boolean) : void
      {
         if(param1)
         {
            this.filters = [FilterUtil.getLightFilter(0.2)];
         }
         else
         {
            this.filters = null;
         }
      }
      
      private function get vo() : TreasureBoxVo
      {
         return this.dataSource as TreasureBoxVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            if(_nowState == vo.state)
            {
               return;
            }
            _nowState = vo.state;
            switch(int(vo.state) - 1)
            {
               case 0:
                  this.btn_reward.visible = true;
                  this.btn_reward.skin = TreasureBoxModel.ins.closeUrl(treasureType);
                  if(_canRewardEffect)
                  {
                     DisplayUtils.removeSelf(_canRewardEffect);
                  }
                  if(_openEffect)
                  {
                     DisplayUtils.removeSelf(_openEffect);
                  }
                  this.btn_reward.commitMeasure();
                  this.btn_reward.bottom = 0;
                  break;
               case 1:
                  if(treasureType == 3)
                  {
                     this.btn_reward.visible = false;
                     if(_canRewardEffect == null)
                     {
                        _canRewardEffect = new BmcSpriteSheet();
                        _canRewardEffect.init(9002,1,"all",true);
                     }
                     if(_openEffect)
                     {
                        DisplayUtils.removeSelf(_openEffect);
                     }
                     _canRewardEffect.x = -25;
                     _canRewardEffect.y = -35;
                     DisplayUtils.mouseEnabled(_canRewardEffect,false);
                     this.addChild(_canRewardEffect);
                  }
                  else
                  {
                     this.btn_reward.visible = true;
                     this.btn_reward.skin = TreasureBoxModel.ins.closeUrl(treasureType);
                     if(_canRewardEffect == null)
                     {
                        _canRewardEffect = new BmcSpriteSheet();
                        _canRewardEffect.init(1015006,1,"all",true);
                        _canRewardEffect.scaleX = 0.6;
                        _canRewardEffect.scaleY = 0.6;
                     }
                     if(_openEffect)
                     {
                        DisplayUtils.removeSelf(_openEffect);
                     }
                     _canRewardEffect.x = -43;
                     _canRewardEffect.y = -44;
                     DisplayUtils.mouseEnabled(_canRewardEffect,false);
                     this.addChildAt(_canRewardEffect,0);
                  }
                  this.btn_reward.commitMeasure();
                  this.btn_reward.bottom = 0;
                  break;
               case 2:
                  this.btn_reward.visible = true;
                  this.btn_reward.skin = TreasureBoxModel.ins.hasRewardUrl(treasureType);
                  if(_canRewardEffect)
                  {
                     DisplayUtils.removeSelf(_canRewardEffect);
                  }
                  if(_openEffect)
                  {
                     DisplayUtils.removeSelf(_openEffect);
                  }
                  this.btn_reward.commitMeasure();
                  this.btn_reward.bottom = 0;
                  break;
               case 3:
                  this.btn_reward.visible = true;
                  this.btn_reward.skin = TreasureBoxModel.ins.openUrl(treasureType);
                  if(_canRewardEffect)
                  {
                     DisplayUtils.removeSelf(_canRewardEffect);
                  }
                  if(_openEffect == null)
                  {
                     _openEffect = new BmcSpriteSheet();
                     _openEffect.init(9001,1,"all",true);
                     _openEffect.x = -62;
                     _openEffect.y = -80;
                  }
                  this.addChild(_openEffect);
                  this.btn_reward.commitMeasure();
                  this.btn_reward.bottom = 0;
            }
         }
         if(vo && vo.toolTip)
         {
            this.toolTip = vo.toolTip;
         }
      }
   }
}
