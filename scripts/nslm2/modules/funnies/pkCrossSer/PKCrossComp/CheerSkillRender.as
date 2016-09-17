package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.pkCrossSer.cheer.CheerSkillRenderUI;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CrossArenaCheerInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcCrossArenaCheerVo;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class CheerSkillRender extends CheerSkillRenderUI
   {
       
      
      public function CheerSkillRender()
      {
         super();
         this.btn_cheer.clickHandler = onCheerClick;
      }
      
      private function onCheerClick() : void
      {
         ObserverMgr.ins.sendNotice("OPT_FINAL_CHEER",vo.cheerId);
      }
      
      public function get vo() : CrossArenaCheerInfo
      {
         return dataSource as CrossArenaCheerInfo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:* = null;
         var _loc2_:int = 0;
         var _loc6_:int = 0;
         .super.dataSource = param1;
         if(!param1)
         {
            return;
         }
         var _loc9_:StcCrossArenaCheerVo = StcMgr.ins.getCrossArenaCheerVo(vo.cheerId);
         var _loc5_:StcBuffVo = StcMgr.ins.getBuffVo(_loc9_.buff_id);
         this.txt_name.text = LocaleMgr.ins.getStr(_loc5_.name);
         this.img_icon.skin = UrlLib.buffIcon(int(_loc5_.icon_id));
         var _loc4_:Array = _loc9_.buff_info.split("|");
         var _loc8_:int = 0;
         var _loc3_:* = 0;
         while(_loc8_ < _loc4_.length)
         {
            _loc7_ = _loc4_[_loc8_].split(":");
            _loc3_ = Number(_loc7_[1]);
            if(vo.exp >= _loc3_)
            {
               _loc8_++;
               continue;
            }
            break;
         }
         if(_loc8_ > 0)
         {
            this.txt_name.text = this.txt_name.text + (" lv." + _loc8_);
         }
         if(_loc8_ >= _loc4_.length)
         {
            this.txt_name.text = this.txt_name.text + " (MAX)";
         }
         this.txt_jihuo.text = LocaleMgr.ins.getStr(50600014,[vo.exp,_loc3_]);
         if(_loc8_ <= 0)
         {
            _loc2_ = _loc5_.init_effect_value1 * (_loc8_ + 1) * 100;
            this.txt_desc.text = LocaleMgr.ins.getStr(50600015) + LocaleMgr.ins.getStr(_loc5_.desc,[_loc2_]);
         }
         else if(_loc8_ >= _loc4_.length)
         {
            _loc2_ = _loc5_.init_effect_value1 * _loc8_ * 100;
            this.txt_desc.text = LocaleMgr.ins.getStr(_loc5_.desc,[_loc2_]);
         }
         else
         {
            _loc2_ = _loc5_.init_effect_value1 * _loc8_ * 100;
            _loc6_ = _loc5_.init_effect_value1 * (_loc8_ + 1) * 100;
            this.txt_desc.text = LocaleMgr.ins.getStr(_loc5_.desc,[_loc2_]) + LocaleMgr.ins.getStr(50600016,[_loc6_]);
         }
      }
   }
}
