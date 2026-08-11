Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A93148D9;
	Tue, 11 Aug 2026 07:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786431705; cv=none; b=FD04JIgkOngeE0CY6O5QloD8bBXAbeVNRRKe0f6hI7NW/bjTvjBwUEVooTXKMQnzIy+LxeML1xJeelodFiTSqadsGoEd0LgYIDhmjA2zBWMNPYcMwsu5bcPaEukV54adg8sFzi7KAwvwKIYPwFoRh2ONwqAqDrPb2TIm3+6Vdxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786431705; c=relaxed/simple;
	bh=H/iAh4jZ9gR0a94yGMvODTyjo/Zaug02f8QMbRczs+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZvvQsgx7aFVcC8+wV9gT4g0AT/M6d/2mi6PktpViP2NVvDwcLQt1/nGpHktgPz2wyTTi45OBueiaFAsn1jHqt9p5fgO0txdHrYSiRQpjYpPWV5VlBX9Sl3ue+EySBUpnIHu8l2KmMXe5/OMQeavyfTjztejVualiF749h6BhHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzvOrkg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzvOrkg8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70E4FC2BCC7;
	Tue, 11 Aug 2026 07:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786431705;
	bh=H/iAh4jZ9gR0a94yGMvODTyjo/Zaug02f8QMbRczs+8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lzvOrkg8wdC7ziEWLF2JCJ86dlCdDMJW5klFdhsmJAiWqdRa3xQ0YHZHWb5lAEBGd
	 c+yPCdpOg2l9rcWseXS1RWyjCVjQSuhXwf0QT2SuibMfIcnWVX4rHeFOFMVAxJUR13
	 vpGcN7Xs+juHPu98M8eJtqJnNiXsfMA8UkQHbnZ0aKoZzXANkP6urShofPvdzn0kTM
	 sDJhN754KQ731kLA0DdXum9+0mo8vObtWq53VNWUvs0TllFOfhd042hn4/ksO969Ag
	 9xJr7g4VzLC2zC+xrGdOLc2oe2nS8szDv+BtwYJC9bT0ajcfQN92xQUwP9KXau4+Ks
	 0vTJ0EscYtErQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DACC5B569;
	Tue, 11 Aug 2026 07:01:45 +0000 (UTC)
From: Vishnu Razdan via B4 Relay <devnull+vrazdan.openai.com@kernel.org>
Date: Tue, 11 Aug 2026 00:01:27 -0700
Subject: [PATCH] io_uring/io-wq: fix worker accounting when canceling
 creation callbacks
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-vrazdan-io-wq-b4-submit-v1-1-719ced16c921@openai.com>
X-B4-Tracking: v=1; b=H4sIAMbIemoC/yWMwQ6CMBBEf4Xs2U1aUhX8FeOhLYusgQItRSLh3
 231Nm/yZnYI5JkC3IodPK0ceHQJ5KkA22n3JOQmMZSivIhKCly9/jTaIY/4ntEoDNEMvGBta9W
 0Up2vsoK0njy1vP2e748/J/NFdsl32TA6EBqvne1y1bOLGw6aXUqEUzQ9W8wSHMcXW9QkuKgAA
 AA=
X-Change-ID: 20260810-vrazdan-io-wq-b4-submit-9c94df145718
To: axboe@kernel.dk
Cc: io-uring@vger.kernel.org, vrazdan@openai.com, 
 linux-kernel@vger.kernel.org, asml.silence@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786431705; l=2133;
 i=vrazdan@openai.com; s=io-wq-kernel-20260811; h=from:subject:message-id;
 bh=BudlQE+XkmRRoHQjFbXZv3L3ZO0exGygvlY2UfDjXFs=;
 b=4lcLmSMBawdC2cbRCMIWnW8jO7Buvnp6m/vN41G4Ry6tz6SLjDiF/C7Y6whPXEawgOZR141vw
 c8vhYriGRaFAEDOBT2Or9ASBGL71xG3wMEjxUHg1Fyzo8Bl/tGBGFLb
X-Developer-Key: i=vrazdan@openai.com; a=ed25519;
 pk=45vHW8D/KId5RtsP3Qx7zMcNpgDwEvCnL5uAw0KzuS0=
X-Endpoint-Received: by B4 Relay for
 vrazdan@openai.com/io-wq-kernel-20260811 with auth_id=937
X-Original-From: Vishnu Razdan <vrazdan@openai.com>
Reply-To: vrazdan@openai.com

From: Vishnu Razdan <vrazdan@openai.com>

create_worker_cb() reserves an io-wq worker slot only after its
task-work callback runs. If the callback is canceled before then,
io_worker_cancel_cb() still decrements acct->nr_workers. When an
existing worker retires with its creation callback pending, that
worker has already decremented the same account's worker count.

The resulting undercount permits worker creation beyond the account's
configured limit. On an AST2600 OpenBMC system, an unchanged sensor
daemon reached 4,291 threads with the original kernel. With an
equivalent downstream fix, 25 passive samples under its normal
workload showed 6-9 threads.

Decrement nr_workers only when the canceled callback is not
create_worker_cb(). Continuation callbacks still release their reserved
slot, and both callback types retain the existing running-count,
reference-count, and create-state cleanup.

Fixes: 1d5f5ea7cb7d ("io-wq: remove worker to owner tw dependency")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Vishnu Razdan <vrazdan@openai.com>
---
Prevent unreserved worker-creation callbacks from decrementing the worker count.
---
 io_uring/io-wq.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/io_uring/io-wq.c b/io_uring/io-wq.c
index 2e14880ee..fa403ed24 100644
--- a/io_uring/io-wq.c
+++ b/io_uring/io-wq.c
@@ -211,9 +211,12 @@ static void io_worker_cancel_cb(struct io_worker *worker)
 	struct io_wq *wq = worker->wq;
 
 	atomic_dec(&acct->nr_running);
-	raw_spin_lock(&acct->workers_lock);
-	acct->nr_workers--;
-	raw_spin_unlock(&acct->workers_lock);
+	/* create_worker_cb() has not reserved a worker slot yet. */
+	if (worker->create_work.func != create_worker_cb) {
+		raw_spin_lock(&acct->workers_lock);
+		acct->nr_workers--;
+		raw_spin_unlock(&acct->workers_lock);
+	}
 	io_worker_ref_put(wq);
 	clear_bit_unlock(0, &worker->create_state);
 	io_worker_release(worker);

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260810-vrazdan-io-wq-b4-submit-9c94df145718

Best regards,
--  
Vishnu Razdan <vrazdan@openai.com>


