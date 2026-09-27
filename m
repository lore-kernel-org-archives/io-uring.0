Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2161A681B
	for <io-uring@vger.kernel.org>; Sun, 27 Sep 2026 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503018; cv=none; b=qCqt70XfCoOlZ+8Xzlu9ldSLnjWsYdG3H2TRkz54Y5jiDzo6JFssZWsPUJzpTfu4uZZg073tPwPDG7a0GDl1QQqpMyleNxAyJKg2SBpWJTtWwyriF/Fmp6fZqN8x8nAlk3gqKl7eNscfQ4uJqsaj/bFge6jYndMo+ZrxrhByAEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503018; c=relaxed/simple;
	bh=+XssL+5/VKoIcOo7kxileVI797EFKQps8zsN29Aaxgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INdTReYZflpjVO36ixhjejd3EOxy98hgPS0Tecb0tlgG2wx3jodIX1FyunRYr4SmhcbWfVWU4qxC1bYMlViF5F9vhkRly+0Ls3tJjNB0Ki1MUpNYYHxZz3uRkGS2PxtAhU07TGKx5xpqRr/b181Qs0iGpOITGUUen/2MhInN5No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXlbQAmc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXlbQAmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790503015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GeQRz4yaAkRJwxzEj563ZTHoqPAjh75IA3h9MwfXlyk=;
	b=WXlbQAmche81TR7L+I8y+gNPsSg4vHvdN7r68o9hmQd6o3V5cJAIuUxnTLRIxbr4s+im46
	xQiJGwdwmXl6oMqC9LLP9cLvf8Z7q9OZ0MFIg7lI8BGLk9MOm1sVeGpfXYx099Ky3tusou
	Xl/apN+3YcfJR39glQ5KOZGCMwdnGig=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-T0D9U2BLPAmMdA_csIQWog-1; Sun,
 27 Sep 2026 05:56:51 -0400
X-MC-Unique: T0D9U2BLPAmMdA_csIQWog-1
X-Mimecast-MFC-AGG-ID: T0D9U2BLPAmMdA_csIQWog_1790503010
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D3511956057;
	Sun, 27 Sep 2026 09:56:50 +0000 (UTC)
Received: from fedora (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 02AD21956086;
	Sun, 27 Sep 2026 09:56:47 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 27 Sep 2026 11:56:49 +0200 (CEST)
Date: Sun, 27 Sep 2026 11:56:46 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: io-uring@vger.kernel.org
Subject: io_wq_worker_wake() calls ttwu() twice if TIF_NOTIFY_SIGNAL is not
 set
Message-ID: <arjoXp6ovCAXxb8l@redhat.com>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

I can't understand what this trivial helper is trying to do.

Does it really need to set TIF_NOTIFY_SIGNAL and do the unconditonal
wakeup including TASK_UNINTERRUPTIBLE? In this case in can just do

	static bool io_wq_worker_wake(struct io_worker *worker, void *data)
	{
		set_tsk_thread_flag(worker->task, TIF_NOTIFY_SIGNAL);
		wake_up_process(worker->task);
		return false;
	}

Or may be it can rely on __set_notify_signal() which does
wake_up_state(TASK_INTERRUPTIBLE) if TIF_NOTIFY_SIGNAL is not set?
Then wake_up_process() should be removed.

Confused ;)

Oleg.

