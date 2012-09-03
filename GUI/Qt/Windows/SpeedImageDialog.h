#ifndef SPEEDIMAGEDIALOG_H
#define SPEEDIMAGEDIALOG_H

#include <QDialog>
#include <SNAPCommon.h>

class SnakeWizardModel;
class ThresholdSettingsRenderer;

namespace Ui {
class SpeedImageDialog;
}

class SpeedImageDialog : public QDialog
{
  Q_OBJECT

public:
  explicit SpeedImageDialog(QWidget *parent = 0);
  ~SpeedImageDialog();

  void SetModel(SnakeWizardModel *model);

  void showEvent(QShowEvent *event);
  void closeEvent(QCloseEvent *event);

private slots:
  void on_btnApply_clicked();

  void on_btnOk_clicked();

  void on_btnClose_clicked();

  void on_tabWidget_currentChanged(int index);

private:
  Ui::SpeedImageDialog *ui;

  SnakeWizardModel *m_Model;

  // Renderer used in the threshold settings window.
  // TODO: it seems wrong to have the Qt classes own renderer objects,
  // perhaps this should be owned by the model instead?
  SmartPtr<ThresholdSettingsRenderer> m_ThresholdRenderer;
};

#endif // SPEEDIMAGEDIALOG_H
