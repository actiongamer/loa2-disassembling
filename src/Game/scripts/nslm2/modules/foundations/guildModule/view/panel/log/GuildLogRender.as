package nslm2.modules.foundations.guildModule.view.panel.log
{
   import game.ui.guildModules.log.GuildLogRenderUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.FamilyLog;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.foundations.guildModule.util.GuildUtil;
   
   public class GuildLogRender extends GuildLogRenderUI
   {
      
      public static const DONATE_NAME:Array = ["",LocaleMgr.ins.getStr(999000547),LocaleMgr.ins.getStr(999000548),LocaleMgr.ins.getStr(999000549)];
       
      
      private var _data:FamilyLog;
      
      public function GuildLogRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         _data = param1 as FamilyLog;
         if(_data)
         {
            txt_time.text = "[" + TimeUtils.getFullTimeStr(_data.time) + "]";
            switch(int(_data.key) - 1)
            {
               case 0:
                  if(_data.name == GuildModel.ins.guildInfo.leader)
                  {
                     _loc2_ = getNameStr(_data.name) + LocaleMgr.ins.getStr(999000577);
                  }
                  else
                  {
                     _loc2_ = getNameStr(_data.name) + LocaleMgr.ins.getStr(999000578);
                  }
                  break;
               case 1:
                  _loc2_ = getNameStr(_data.name) + LocaleMgr.ins.getStr(999000282);
                  break;
               case 2:
                  _loc2_ = LocaleMgr.ins.getStr(999000281,[getNameStr(_data.tname),getNameStr(_data.name)]);
                  break;
               case 3:
                  _loc2_ = LocaleMgr.ins.getStr(999000283,[getNameStr(_data.tname),GuildUtil.getPostName(_data.con)]);
                  break;
               case 4:
                  _loc2_ = LocaleMgr.ins.getStr(999000284,[getNameStr(_data.name),getDonateName(_data.con)]);
                  break;
               case 5:
                  _loc2_ = LocaleMgr.ins.getStr(999000285,[_data.con]);
            }
            txt_log.isHtml = true;
            txt_log.text = _loc2_;
         }
      }
      
      private function getDonateName(param1:int) : String
      {
         return DONATE_NAME[param1];
      }
      
      private function getNameStr(param1:String) : String
      {
         return "<font color=\'#FFFF00\'>" + param1 + "</font>";
      }
   }
}
