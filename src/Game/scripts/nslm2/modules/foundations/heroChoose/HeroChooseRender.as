package nslm2.modules.foundations.heroChoose
{
   import game.ui.heroChooseModules.HeroChooseRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroNodeVo;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.MouseEvent;
   
   public class HeroChooseRender extends HeroChooseRenderUI
   {
       
      
      private var _stcNpcVo:StcNpcVo;
      
      public function HeroChooseRender()
      {
         super();
         this.addEventListener("click",onMouseClicked);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _stcNpcVo = param1 as StcNpcVo;
            .super.dataSource = WealthUtil.createNpcVo(_stcNpcVo.id);
            _loc2_ = StcMgr.ins.getHeroNodeVo(_stcNpcVo.node);
            if(HeroChooseModel.ins.choosedNpcId == _stcNpcVo.id)
            {
               this.checkBox_choose.selected = true;
               this.img_frame.visible = true;
            }
            else
            {
               this.checkBox_choose.selected = false;
               this.img_frame.visible = false;
            }
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      private function onMouseClicked(param1:MouseEvent) : void
      {
         if(HeroChooseModel.ins.choosedNpcId == _stcNpcVo.id)
         {
            HeroChooseModel.ins.choosedNpcId = 0;
            this.checkBox_choose.selected = false;
         }
         else
         {
            HeroChooseModel.ins.choosedNpcId = _stcNpcVo.id;
            this.checkBox_choose.selected = true;
         }
         ObserverMgr.ins.sendNotice("heroChoosed");
      }
      
      override public function getFocusNotices() : Array
      {
         return ["heroChoosed"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("heroChoosed" === _loc3_)
         {
            changeChoosedNpc();
         }
      }
      
      private function changeChoosedNpc() : void
      {
         if(HeroChooseModel.ins.choosedNpcId == _stcNpcVo.id)
         {
            this.checkBox_choose.selected = true;
            this.img_frame.visible = true;
         }
         else
         {
            this.checkBox_choose.selected = false;
            this.img_frame.visible = false;
         }
      }
   }
}
