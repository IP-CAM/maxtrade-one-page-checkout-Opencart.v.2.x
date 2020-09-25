<?php
class ControllerModuleMtOnepageCheckout extends Controller {
	private $error = array();
	
	private $mt_onepage_checkout_version = "1.0.1";

	public function index() {
		/* Load language file. */
		$this->load->language('module/mt_onepage_checkout');

		$this->document->setTitle($this->language->get('heading_title') . " ver." . $this->mt_onepage_checkout_version);

		/* Check if data has been posted back. */
		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('mt_onepage_checkout', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->cache->delete('mt_onepage_checkout');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		/* Load language strings. */
		$data['heading_title'] = $this->language->get('heading_title') . " ver." . $this->mt_onepage_checkout_version;

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_module'] = $this->language->get('text_module');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');


		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_status_small'] = $this->language->get('entry_status_small');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		/* Loading up some URLS. */
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$data['form_action'] = $this->url->link('module/mt_onepage_checkout', 'token=' . $this->session->data['token'], 'SSL');

		/* Initial values for form. */
		if (isset($this->request->post['mt_onepage_checkout_status'])) {
			$data['mt_onepage_checkout_status'] = $this->request->post['mt_onepage_checkout_status'];
		} else {
			$data['mt_onepage_checkout_status'] = $this->config->get('mt_onepage_checkout_status');
		}

		/* Breadcrumb. */
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/mt_onepage_checkout', 'token=' . $this->session->data['token'], 'SSL')
		);
	
		/* Render some output. */
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		/* Error warning */
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$this->response->setOutput($this->load->view('module/mt_onepage_checkout.tpl', $data));
		

	}
	
	public function getMtVersion(){
		return $this->mt_onepage_checkout_version;
	}
	
	
}
